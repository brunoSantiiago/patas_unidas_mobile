import 'package:patas_unidas_mobile/core/domain/entities/user.dart';
import 'package:patas_unidas_mobile/core/dto/login_dto.dart';

abstract class LoginUserPort {
  Future<User> login(LoginDTO dto);
}
