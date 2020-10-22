import 'dart:async';
import 'dart:io';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_provider_template/page/splash_page.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'common/config/config.dart';
import 'common/event/event.dart';
import 'common/model/http/entity_factory.dart';
import 'common/net/api_adress.dart';
import 'common/net/code.dart';
import 'common/style/SMtheme.dart';
import 'common/utils/FallbackCupertinoLocalisationsDelegate.dart';
import 'generated/l10n.dart';
import 'navigator_utils.dart';
import 'common/utils/toast_util.dart';
import 'notifier/language_notifier.dart';
import 'notifier/theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  if (Config.REPORT_CRASH) {
    FlutterBugly.postCatchedException(() {
      runApp(MyApp());
    });
  } else {
    runApp(MyApp());
  }
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription stream;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    stream = EventBusHelper.getEventTypeStream<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message, event.noTip);
    });
    EntityCreatorFactory.registerAllCreator();

    LogUtil.init(isDebug: true, tag: "wilson");
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => LanguageNotifier()),
      ],
      child: Consumer<LanguageNotifier>(builder: (context, counter, _) {
        return OKToast(
          child: Consumer<ThemeNotifier>(
            builder: (context, counter, _) {
              var themeNotifier = Provider.of<ThemeNotifier>(context);
              var languageNotifier = Provider.of<LanguageNotifier>(context);
              return new MaterialApp(
//                title: 'Flutter 模板工程',
                theme: SMAppTheme.getThemeData(themeNotifier.theme),
                navigatorObservers: [
                  NavigatorUtils.getInstance(),
                ],
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  FallbackCupertinoLocalisationsDelegate(),
                ],
                supportedLocales: [const Locale('en', ''), ...S.delegate.supportedLocales],
                //修改本地语言
                locale: Locale(languageNotifier.language.languageCode, languageNotifier.language.countryCode),
                //初始化本地语言
                localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
                  if (locale.languageCode == "zh") {
                    if (locale.toString() == "zh_CN") {
                      return const Locale('zh', 'CN');
                    } else {
                      return const Locale('zh', 'TW');
                    }
                  }
                  return locale;
                },
                initialRoute: SplashPage.sName,
                routes: NavigatorUtils.configRoutes,
                builder: (BuildContext context, Widget child) {
                  return FlutterEasyLoading(child: child);
                },
              );
            },
          ),
        );
      }),
    );
  }

  errorHandleFunction(int code, message, noTip) {
    switch (code) {
    /////////////一定提示//////////////
      case 401:
        break;
      case Code.STATUS_CODE_UPLOAD_FAILURE:
      //上传失败
        ToastUtil.showRed('上传失败');
        break;

    ////////////////线上不提示Dio报错///////////
      case Code.STATUS_CODE_DIO_ERROR:
        if (Config.API_SETTING != APIType.PRODUCTION) ToastUtil.showRed('Dio报错');
        break;

    /////////////按需提示//////////////
      case Code.STATUS_CODE_NETWORK_ERROR:
        if (!noTip) ToastUtil.showRed('网络错误');
        break;
      case 403:
        if (!noTip) ToastUtil.showRed('403权限错误');
        break;
      case 404:
        if (!noTip) ToastUtil.showRed('404错误');
        break;
      case Code.STATUS_CODE_NETWORK_TIMEOUT:
      //超时
        if (!noTip) ToastUtil.showRed('请求超时');
        break;
      default:
        if (!noTip) ToastUtil.showRed("network_error_unknown " + message);
        break;
    }
  }
}
