import 'package:flutter/material.dart';
import 'package:flutter_provider_template/common/config/config.dart';
import 'package:flutter_provider_template/common/db/database.dart';
import 'package:flutter_provider_template/common/utils/log_util.dart';
import 'package:flutter_provider_template/navigator_utils.dart';
import 'package:flutter_provider_template/common/utils/screen_util.dart';
import 'package:flutter_provider_template/common/widget/drag_debug_widget.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  static final String sName = "/";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    init();
    if (Config.DEBUG_ENTER) {
      Future.delayed(Duration(milliseconds: Config.JUMP_PAGE_DELAY), () {
        _showDebugEnter();
      });
    }


    Future.delayed(Duration(milliseconds: Config.JUMP_PAGE_DELAY), () {
        NavigatorUtils.getInstance()
            .pushReplacementNamed(context, HomePage.sName);
    });
  }

  init() {
    DBProvider.db.init("user_db");
  }


  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    NavigatorUtils.getInstance().setContext(context);
    // 初始化屏幕信息
    ScreenUtil.getInstance().init(context);
  }

  _showDebugEnter() {
    OverlayEntry overlayEntry;

    overlayEntry = new OverlayEntry(builder: (context) {
      return DragDebugWidget(overlayEntry: overlayEntry);
    });
    Overlay.of(context).insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
        ],
      ),
    );
  }



  login() async {
//    ResponseResult<dynamic> response = await UserDao.loginByPwd("wilson","123456");
  }
}
