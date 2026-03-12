import 'package:injectable/injectable.dart';
import 'package:patas_unidas_mobile/core/domain/entities/user.dart';
import 'package:patas_unidas_mobile/core/ports/auth/out/load_user_port.dart';

@injectable
class LoadUserUseCase {
  final LoadUserPort _loadUserPort;

  LoadUserUseCase(this._loadUserPort);

  Stream<User?> execute() {
    return _loadUserPort.loadUser();
  }
}
