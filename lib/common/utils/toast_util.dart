import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_provider_template/common/widget/sm_toast_widget.dart';
import 'package:flutter_provider_template/common/widget/toast_center_widget.dart';
import 'package:flutter_provider_template/common/widget/toast_rectangle_center_widget.dart';

import '../style/SMColors.dart';

const int toastDuration = 1500;

class ToastUtil {
  static ToastFuture showRed(String msg) {
    return showToastWidget(
      SMToastWidget(
        color: SMColors.toastRed,
        content: msg,
      ),
      duration: Duration(milliseconds: toastDuration),
    );
  }

  static ToastFuture showGreen(String msg) {
    return showToastWidget(
      SMToastWidget(
        color: SMColors.toastGreen,
        content: msg,
      ),
      duration: Duration(milliseconds: toastDuration),
    );
  }

  static ToastFuture showGray(String msg) {
    return showToastWidget(
      SMToastWidget(
        color: SMColors.toastGray,
        content: msg,
      ),
      duration: Duration(milliseconds: toastDuration),
    );
  }

  static ToastFuture showCenterGray(String msg) {
    return showToastWidget(
      ToastCenterWidget(
        color: SMColors.toastGray,
        content: msg,
      ),
      position: ToastPosition.center,
      duration: Duration(milliseconds: toastDuration),
    );
  }


  static ToastFuture showRectangleCenterGray(String msg) {
    return showToastWidget(
      ToastRectangleCenterWidget(
        color: SMColors.toastGray,
        content: msg,
      ),
      position: ToastPosition.center,
      duration: Duration(milliseconds: toastDuration),
    );
  }



}
