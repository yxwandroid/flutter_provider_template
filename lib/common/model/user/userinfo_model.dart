library userinfomodel;

import 'package:flutter_provider_template/common/model/http/entity_factory.dart';
import 'package:flutter_provider_template/common/utils/log_util.dart';



class UserInfoModel extends BaseEntity{

  String msg;
  int status;

  UserInfoModel({this.msg, this.status});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    this.msg = json['msg'];
    this.status = json['status'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }

  @override
  void onParseComplete() {
    Log.i("onParseComplete",UserInfoModel);
  }

}
