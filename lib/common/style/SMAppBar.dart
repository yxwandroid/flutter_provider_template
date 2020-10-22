import 'package:flutter/material.dart';
import 'package:flutter_provider_template/common/style/SMTxtStyle.dart';
import 'SMColors.dart';

class SMAppBar {



  static AppBar getAppBar(String title ){
    AppBar appBar = AppBar(
      iconTheme: IconThemeData(
          color: SMColors.textColor333333
      ),
      title: Text(title,style: SMTxtStyle.color333333dp18,),
      elevation: 0,
    );
    return appBar;
  }


}