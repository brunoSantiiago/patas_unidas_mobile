import 'package:patas_unidas_mobile/core/dto/login_dto.dart';
import 'package:patas_unidas_mobile/core/ports/auth/in/auth_failures.dart';

class LoginCommand {
  final LoginDTO loginDto;

  LoginCommand(this.loginDto);

  void validate() {
    if (!loginDto.email.isValidEmail && !loginDto.password.isValidPassword) {
      throw InvalidPasswordFailure();
    }
    if (!loginDto.email.isValidEmail) {
      throw InvalidEmailFailure();
    }
    if (!loginDto.password.isValidPassword) {
      throw InvalidPasswordFailure();
    }
  }
}

extension Validator on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    return length >= 6;
  }
}
