part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthLoggedInState extends AuthState {
  final User user;

  const AuthLoggedInState(this.user);
}

class AuthUnauthenticatedState extends AuthState {}

class AuthFormErrorState extends AuthState {
  final LoginFormError error;

  const AuthFormErrorState(this.error);
}

class AuthFailureState extends AuthState {
  final String errorMessage;

  const AuthFailureState(this.errorMessage);
}
