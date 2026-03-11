import 'package:injectable/injectable.dart';
import 'package:patas_unidas_mobile/core/ports/auth/out/logout_user_port.dart';

@injectable
class LogoutUseCase {
  final LogoutUserPort _logoutPort;

  LogoutUseCase(this._logoutPort);

  Future<void> execute() async {
    return await _logoutPort.logoutUser();
  }
}
