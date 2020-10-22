/*
 * Copyright (c) 2020. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter_provider_template/common/db/database.dart';
import 'package:flutter_provider_template/common/model/user/user_model.dart';
import 'package:flutter_provider_template/common/utils/log_util.dart';

class UserProvider {
  // 私有构造函数
  UserProvider._() {
    // 具体初始化代码
  }

  // 静态私有成员，没有初始化
  static UserProvider _instance;

  // 静态、同步、私有访问点
  static UserProvider _sharedInstance() {
    if (_instance == null) {
      _instance = UserProvider._();
    }
    return _instance;
  }

  // 单例公开访问点
  static UserProvider get getInstance => _sharedInstance();

  static const tag = "UserProvider";
  static const tableName = "UserInfo";
  static const id = "id";
  static const userName = "userName";
  static const userHead = "userHead";
  static const userSignature = "userSignature";
  static const blueTooth1 = "blueTooth1";
  static const blueTooth2 = "blueTooth2";
  static const blueTooth3 = "blueTooth3";
  static const blueTooth4 = "blueTooth4";
  static const json = "json";

  String createUserInfoSql = "CREATE TABLE $tableName ("
      "$id INTEGER PRIMARY KEY,"
      "$userName text,"
      "$userHead text,"
      "$userSignature text,"
      "$blueTooth1 text,"
      "$blueTooth2 text,"
      "$blueTooth3 text,"
      "$blueTooth4 text,"
      "$json text"
      ")";

  Future<bool> insertUserInfo(UserModel userModel) async {
    try {
      final db = await DBProvider.db.database;
      int res = await db.insert(tableName, userModel.toJson());
      Log.i(tag, "$tableName----insert userInfo res:$res");
      return res == 1;
    } catch (e) {
      Log.i(tag, "$tableName----insert userInfo e:$e");
      return false;
    }
  }

  Future<UserModel> getUserInfo() async {
    try {
      final db = await DBProvider.db.database;
      var res = await db.query("$tableName");
      List<UserModel> list = res.isNotEmpty ? res.map((c) => UserModel.fromJson(c)).toList() : [];
      Log.i(tag, "$tableName----get userInfo res:$res");
      return list.first;
    } catch (e) {
      Log.i(tag, "$tableName----get userInfo e:$e");
      return null;
    }
  }

  Future<bool> updateUserInfo(int userId, UserModel userModel) async {
    try {
      final db = await DBProvider.db.database;
      int res = await db.update(tableName, userModel.toJson(), where: "$id = ?", whereArgs: [userId]);
      Log.i(tag, "$tableName----update userInfo res:$res");
      return res == 1;
    } catch (e) {
      Log.i(tag, "$tableName----update userInfo e:$e");

      return false;
    }
  }
}
