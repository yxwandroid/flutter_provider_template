import 'package:flutter_provider_template/common/config/config.dart';

enum APIType {
  // 局域网
  DEV,
  // 外侧
  STAGING,
  // 线上
  PRODUCTION
}

Map<APIType, String> apiMap = {
  APIType.STAGING: 'http://114.67.74.108:8082',
  APIType.PRODUCTION: 'https://app.zhibojiaoyu.cn',
};
Map<APIType, String> socketMap = {
  APIType.STAGING: 'ws://114.67.74.108:10000/chat',
  APIType.PRODUCTION: 'wss://app.zhibojiaoyu.cn/chat',
};

class ApiAddress {
  static final host = apiMap[Config.API_SETTING];
  static final apiHost = '$host/api';

  // 登录
  static login() {
    return '/users/login';
  }
}
