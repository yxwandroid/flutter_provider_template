import 'package:flutter/material.dart';
import 'package:flutter_provider_template/common/style/SMTxtStyle.dart';
import 'package:flutter_provider_template/common/utils/screen_util.dart';

class ToastCenterWidget extends StatelessWidget {
  final Color color;
  final String content;

  ToastCenterWidget({this.color, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().getWidth(100.0),
      height: ScreenUtil.getInstance().getWidth(80.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().getWidth(5.0)))
      ),
      child: Text(content, style: SMTxtStyle.colorfffdp18,),
    );
  }
}