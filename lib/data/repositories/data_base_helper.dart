import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Future<Database> open() async {
    return openDatabase(
      'patas.db',
      version: 1,
      onCreate: (db, version) async {
        // USERS
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE,
            password TEXT,
            name TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE stores (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            code TEXT,
            name TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE user_stores (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            store_id INTEGER,
            FOREIGN KEY (user_id) REFERENCES users(id),
            FOREIGN KEY (store_id) REFERENCES stores(id)
          )
        ''');

        final batch = db.batch();

        batch.insert('users', {
          'email': 'admin@gmail.com',
          'password': '123456',
          'name': 'Admin',
        });
        batch.insert('users', {
          'email': 'thiago.brunoss2017@gmail.com',
          'password': '123456',
          'name': 'Thiago Bruno',
        });
        batch.insert('users', {
          'email': 'wisleii@gmail.com',
          'password': '123456',
          'name': 'Wislei',
        });

        batch.insert('stores', {'code': 'sudoeste', 'name': 'Loja Sudoeste'});
        batch.insert('stores', {'code': 'sul', 'name': 'Loja Sul'});
        batch.insert('stores', {'code': 'noroeste', 'name': 'Loja Noroeste'});

        batch.insert('user_stores', {'user_id': 1, 'store_id': 1});
        batch.insert('user_stores', {'user_id': 1, 'store_id': 2});
        batch.insert('user_stores', {'user_id': 1, 'store_id': 3});

        // Thiago vê sudoeste e sul
        batch.insert('user_stores', {'user_id': 2, 'store_id': 1});
        batch.insert('user_stores', {'user_id': 2, 'store_id': 2});

        // Wislei só sudoeste
        batch.insert('user_stores', {'user_id': 3, 'store_id': 1});
        batch.insert('user_stores', {'user_id': 3, 'store_id': 3});

        await batch.commit(noResult: true);
      },
    );
  }
}
