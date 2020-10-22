import 'package:flutter/material.dart';

class SMBoxDecoration {

  static  BoxDecoration homeTextBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.elliptical(68, 68)),
    border: Border.all(width: 0.2, color: Color(0xFFB6B6B6)),
  );
  static  BoxDecoration getThemeBoxDecoration(int themeColor){
    BoxDecoration themeBoxDecoration = BoxDecoration(
      color: Color(themeColor),
      borderRadius: BorderRadius.all(Radius.elliptical(60, 60)),
      border: Border.all(width: 0.2, color: Color(0xFFB6B6B6)),
    );

    return themeBoxDecoration;
  }


  static  BoxDecoration getThemeBoxDecorationByColor(Color themeColor){
    BoxDecoration themeBoxDecoration = BoxDecoration(
      color: themeColor,
      borderRadius: BorderRadius.all(Radius.elliptical(60, 60)),
      border: Border.all(width: 0.2, color: Color(0xFFB6B6B6)),
    );

    return themeBoxDecoration;
  }

}

