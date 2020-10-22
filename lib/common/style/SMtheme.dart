/*
 * Copyright (c) 2020. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan. 
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna. 
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus. 
 * Vestibulum commodo. Ut rhoncus gravida arcu. 
 */

import 'package:flutter/material.dart';
import 'package:flutter_provider_template/common/style/SMThemeColor.dart';
import 'package:flutter_provider_template/common/utils/log_util.dart';
class SMAppTheme {
  //static int mainColor = 0xFFD32F2F;
  static int mainColor;
  static int secondColor = 0xFFFFFFFF;
  static int thirdColor = 0xFFFAFAFA;
  static int greyColor = 0x8A000000;
  static int blackColor = 0xFF000000;
  static int lineColor = 0xFFEEEEEE;
  static getThemeData(String theme) {
    Log.i("AppTheme", "=getThemeData=$theme");
    mainColor = sMThemeColor[theme];
    ThemeData themData = ThemeData(
//      textTheme: TextTheme(
//        body1: TextStyle(
//            // color: Colors.black,
//            // fontWeight: FontWeight.bold,
//            ),
//      ),
      //platform: TargetPlatform.iOS,
      iconTheme: IconThemeData(
        size: 32,
        color: Color(thirdColor),
        opacity: 0.85,
      ),
      // primaryIconTheme 导航栏按钮颜色
      primaryIconTheme: IconThemeData(
        color: Color(secondColor),
      ),
      accentColor: Colors.grey, // 选中颜色
      primaryColor: Color(mainColor), // appbar背景
//      primaryTextTheme: TextTheme(
//          title: TextStyle(
//              // color: Colors.red
//              ),
//          button: TextStyle(color: Colors.red)),
      scaffoldBackgroundColor: Color(secondColor), // 整体的scaffold背景颜色
    );
    return themData;
  }
}
