import 'package:injectable/injectable.dart';
import 'package:patas_unidas_mobile/core/domain/entities/user.dart' as entity;
import 'package:patas_unidas_mobile/core/dto/login_dto.dart';
import 'package:patas_unidas_mobile/core/models/user_model.dart' as model;
import 'package:patas_unidas_mobile/core/ports/auth/out/load_user_port.dart';
import 'package:patas_unidas_mobile/core/ports/auth/out/login_user_port.dart';
import 'package:patas_unidas_mobile/core/ports/auth/out/logout_user_port.dart';
import 'package:patas_unidas_mobile/core/ports/auth/out/shared_prefs_port.dart';
import 'package:patas_unidas_mobile/data/repositories/auth_data_source_mock.dart';
import 'package:sqflite/sqlite_api.dart';
import '../exception/http_exception.dart';

@Environment(Environment.dev)
class MockAuthAdapter implements LoginUserPort, LogoutUserPort, LoadUserPort {
  final Database db;
  final SharedPrefsPort _sharedPrefs;

  MockAuthAdapter(this.db, this._sharedPrefs);

  @override
  Future<entity.User> login(LoginDTO dto) async {
    final response = await AuthDatasourceMock(db: db).login(dto);

    final statusCode = response['statusCode'] as int;

    if (statusCode == 200 || statusCode == 201) {
      final data = response['data'];

      await _sharedPrefs.setToken(data['token']);
      return model.UserModel.fromJson(data);
    }

    throw HttpException.fromStatusCode(statusCode: statusCode);
  }

  @override
  Future<void> logoutUser() async {
    await _sharedPrefs.clear();
  }

  @override
  Stream<entity.User?> loadUser() async* {
    await Future.delayed(const Duration(seconds: 7));
    try {
      final token = await _sharedPrefs.getToken();

      if (token == null) {
        yield null;
        return;
      }

      final response = await AuthDatasourceMock(db: db).loadUser(token);

      if (response['statusCode'] == 200 || response['statusCode'] == 201) {
        yield model.UserModel.fromJson(response['data']);
        return;
      }

      await _sharedPrefs.clear();
      throw HttpException.fromStatusCode(statusCode: response['statusCode']);
    } on HttpException {
      rethrow;
    } catch (e) {
      // await _sharedPrefs.clear();
      throw HttpException.fromStatusCode(
        statusCode: HttpStatusExceptionType.unexpectedException.statusCode,
      );
    }
  }
}
