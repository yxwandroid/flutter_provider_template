

import 'package:flutter_provider_template/common/net/index.dart';

class Config {
  // API 环境
  static const API_SETTING = APIType.PRODUCTION;
  // bugly上报
  static const REPORT_CRASH = false;
  // Debug入口
  static const DEBUG_ENTER = false;
  // 请求超时时间
  static const HTTP_TIMEOUT = 5000;
  // 分页数量
  static const PAGE_SIZE = 10;

  static const JUMP_PAGE_DELAY = 120;
  static const PRINTLOG_KEY = "print_log";
  static const NETLOG_KEY = "net_log";
  static const TOKEN_KEY = "token";
  static const THEME_KEY = "theme";
  static const PAGE_MODE_KEY = "page_mode";
  static const LANGUAGE_KEY = "language";
}

class PackageType {
  static const android = "android";
  static const ios = "ios";
}

