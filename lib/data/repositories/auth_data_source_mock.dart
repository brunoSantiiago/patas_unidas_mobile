

import 'package:patas_unidas_mobile/core/dto/login_dto.dart';

class AuthDatasourceMock {
  final Database db;

  AuthDatasourceMock({required this.db});

  Future<Map<String, dynamic>> login(LoginDTO dto) async {
    await Future.delayed(const Duration(seconds: 2));

    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [dto.email],
      limit: 1,
    );

    if (result.isEmpty) {
      return {'statusCode': 401};
    }

    final user = result.first;

    if (user['password'] != dto.password) {
      return {'statusCode': 401};
    }

    if (user['email'] != dto.email) {
      return {'statusCode': 401};
    }

    final userId = user['id'] as int;

    final storesResult = await db.rawQuery(
      '''
      SELECT s.id, s.code, s.name
      FROM stores s
      INNER JOIN user_stores us ON us.store_id = s.id
      WHERE us.user_id = ?
    ''',
      [userId],
    );

    final stores = storesResult
        .map(
          (row) => {
            'id': row['id'].toString(),
            'code': row['code'],
            'store_name': row['name'],
          },
        )
        .toList();

    return {
      'statusCode': 200,
      'data': {
        'id': user['id'],
        'email': user['email'],
        'name': user['name'],
        'token': 'local-token-${dto.email}',
        'stores': stores,
      },
    };
  }

  Future<Map<String, dynamic>> loadUser(String token) async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (!token.startsWith('local-token-')) {
      return {'statusCode': 401};
    }

    final email = token.replaceFirst('local-token-', '');

    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );

    if (result.isEmpty) {
      return {'statusCode': 401};
    }

    final user = result.first;

    final userId = user['id'] as int;

    final storesResult = await db.rawQuery(
      '''
      SELECT s.id, s.code, s.name
      FROM stores s
      INNER JOIN user_stores us ON us.store_id = s.id
      WHERE us.user_id = ?
    ''',
      [userId],
    );

    final stores = storesResult
        .map(
          (row) => {
            'id': row['id'].toString(),
            'code': row['code'],
            'store_name': row['name'],
          },
        )
        .toList();

    return {
      'statusCode': 200,
      // 'data': {'email': user['email'], 'name': user['name'], 'stores': stores},
      'data': {'email': user['email'], 'name': user['name'], 'stores': stores},
    };
  }
}
