import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_provider_template/common/db/token_provider.dart';
import 'package:flutter_provider_template/common/db/user_provider.dart';
import 'package:flutter_provider_template/common/utils/log_util.dart';

///
///数据库的操作类
///
class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;
  String dbName;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  /// 数据库初始化
  init(String name) {
    dbName = name;
    initDB();
    Log.i("DBProvider", "-----------初始化数据库成功-------------------");
  }

  ///初始化数据库名称和表结构
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName + ".db");
    return await openDatabase(path, version: 2, onOpen: (db) {}, onCreate: (Database db, int version) async {
      ///添加表的的时候调用的方法
      await db.execute(TokenProvider.getInstance.createTokenInfoSql);
      await db.execute(UserProvider.getInstance.createUserInfoSql);
    });
  }
}
