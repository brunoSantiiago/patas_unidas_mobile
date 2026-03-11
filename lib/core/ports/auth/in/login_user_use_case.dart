import 'package:injectable/injectable.dart';
import 'package:patas_unidas_mobile/core/domain/entities/user.dart';
import 'package:patas_unidas_mobile/core/ports/auth/in/auth_failures.dart';
import 'package:patas_unidas_mobile/core/ports/auth/in/login_command.dart';
import 'package:patas_unidas_mobile/core/ports/auth/out/login_user_port.dart';
import 'package:patas_unidas_mobile/data/exception/http_exception.dart';

@injectable
class LoginUserUseCase {
  final LoginUserPort _loginUserPort;

  LoginUserUseCase(this._loginUserPort);

  Future<User> execute(LoginCommand command) async {
    try {
      return await _loginUserPort.login(command.loginDto);
    } on HttpException catch (e) {
      throw AuthFailure.fromHttp(e);
    }
  }
}
