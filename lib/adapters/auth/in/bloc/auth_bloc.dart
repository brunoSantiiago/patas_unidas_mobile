import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:injectable/injectable.dart';

import 'package:patas_unidas_mobile/core/domain/entities/user.dart';
import 'package:patas_unidas_mobile/core/dto/login_dto.dart';
import 'package:patas_unidas_mobile/core/ports/auth/in/auth_failures.dart';

import 'package:patas_unidas_mobile/core/ports/auth/in/load_user_use_case.dart';
import 'package:patas_unidas_mobile/core/ports/auth/in/login_command.dart';
import 'package:patas_unidas_mobile/core/ports/auth/in/login_form_error.dart';
import 'package:patas_unidas_mobile/core/ports/auth/in/login_user_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase _loginUseCase;
  final LoadUserUseCase _onUserChangedUseCase;
  final LoadUserUseCase _logoutUseCase;

  AuthBloc(this._loginUseCase, this._logoutUseCase, this._onUserChangedUseCase)
    : super(AuthInitialState()) {
    on<LoginAuthEvent>((event, emit) async {
      emit(AuthLoadingState());

      try {
        final command = LoginCommand(event.dto);
        command.validate();
        final user = await _loginUseCase.execute(command);
        emit(AuthLoggedInState(user));
      } on InvalidEmailFailure catch (e) {
        emit(AuthFormErrorState(LoginFormError(email: e.message)));
      } on InvalidPasswordFailure catch (e) {
        emit(AuthFormErrorState(LoginFormError(password: e.message)));
      } on AuthFailure catch (e) {
        emit(AuthFailureState(e.message));
      } catch (e) {
        emit(AuthFailureState("Erro inesperadoo. ${e.toString()}"));
      }
    });

    on<AppStartedEvent>((event, emit) async {
      try {
        await emit.forEach<User?>(
          _onUserChangedUseCase.execute(),
          onData: (user) {
            if (user != null) {
              return AuthLoggedInState(user);
            } else {
              return AuthUnauthenticatedState();
            }
          },
        );
      } on AuthFailure catch (e) {
        emit(AuthFailureState(e.message));
      } catch (e) {
        emit(
          AuthFailureState(
            "Erro inesperado ao carregar usuário. ${e.toString()}",
          ),
        );
      }
    });

    on<LogoutAuthEvent>((event, emit) async {
      await _logoutUseCase.execute();
      emit(AuthUnauthenticatedState());
    });
  }
}
