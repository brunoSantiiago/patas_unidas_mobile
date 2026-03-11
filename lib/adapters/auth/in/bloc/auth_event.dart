part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AppStartedEvent extends AuthEvent {}

class LoginAuthEvent extends AuthEvent {

  final LoginDTO dto;

  LoginAuthEvent(this.dto);
}

class LogoutAuthEvent extends AuthEvent {}

class OnUserChangedEvent extends AuthEvent {
  final User? user;

  OnUserChangedEvent(this.user);
}
