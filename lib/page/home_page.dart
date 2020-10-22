import 'package:flutter/material.dart';
import 'package:flutter_provider_template/common/config/config.dart';
import 'package:flutter_provider_template/common/db/database.dart';
import 'package:flutter_provider_template/common/style/SMAppBar.dart';
import 'package:flutter_provider_template/common/utils/log_util.dart';
import 'package:flutter_provider_template/generated/l10n.dart';
import 'package:flutter_provider_template/navigator_utils.dart';
import 'package:flutter_provider_template/common/utils/screen_util.dart';
import 'package:flutter_provider_template/common/widget/drag_debug_widget.dart';
import 'package:flutter_provider_template/page/setting_page.dart';

class HomePage extends StatefulWidget {
  static final String sName = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMAppBar.getAppBar(S.of(context).home),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("设置界面"),
                onTap: () {
                  NavigatorUtils.getInstance().pushNamed(context, SettingPage.sName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
//    ResponseResult<dynamic> response = await UserDao.loginByPwd("wilson","123456");
  }
}
