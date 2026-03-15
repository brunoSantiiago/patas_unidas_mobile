import 'package:patas_unidas_mobile/data/exception/http_exception.dart';

abstract class AuthFailure implements Exception {
  final String message;

  const AuthFailure(this.message);

  factory AuthFailure.fromHttp(HttpException e) {
    return GenericAuthFailure(e.message);
  }
}

class InvalidCredentialsFailure extends AuthFailure {
  InvalidCredentialsFailure() : super("E-mail ou senha incorretos.");
}

class ServerFailure extends AuthFailure {
  ServerFailure() : super("O servidor está instável. Tente mais tarde.");
}

class ConnectionFailure extends AuthFailure {
  ConnectionFailure() : super("Verifique sua conexão com a internet.");
}

class InvalidEmailFailure extends AuthFailure {
  InvalidEmailFailure() : super("O formato do e-mail é inválido.");
}

class InvalidPasswordFailure extends AuthFailure {
  InvalidPasswordFailure() : super("A senha deve ter no mínimo 6 caracteres.");
}

class InvalidPasswordAndEmailFailure extends AuthFailure {
  InvalidPasswordAndEmailFailure()
    : super("E-mail e senha com formato inválido.");
}

class GenericAuthFailure extends AuthFailure {
  GenericAuthFailure(super.message);
}
