import 'package:patas_unidas_mobile/core/domain/entities/user.dart';

abstract class LoadUserPort {
  Stream<User?> loadUser();
}
