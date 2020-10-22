import 'package:flutter/material.dart';
import 'package:flutter_provider_template/common/config/config.dart';
import 'package:flutter_provider_template/common/model/theme/theme_entity.dart';
import 'package:flutter_provider_template/common/style/SMThemeColor.dart';
import 'package:flutter_provider_template/common/utils/storage_util.dart';

class  ThemeNotifier extends ChangeNotifier{
  String  _theme = "white";

  String get theme => _theme;

  List<ThemeEntity> _allTheme = List();

  List<ThemeEntity> get allTheme => _allTheme;

  ThemeNotifier(){
    getTheme();
    initTheme();
  }

  Future getTheme() async {
    String _theme =  await StorageManager.getInstance().get(Config.THEME_KEY);
    if (_theme != null&&_theme!="") {
      setTheme(_theme);
    }
  }

  Future setTheme(theme) async {
    _theme = theme;
    await StorageManager.getInstance().save(Config.THEME_KEY,theme);

    initTheme();//进行主题更新
    notifyListeners();
  }


  //初始化所有的主题
  initTheme() {
    _allTheme.clear();
    ThemeEntity currentTheme ;
    sMThemeColor.forEach((key, value) {
      if (key == _theme) {
        currentTheme = ThemeEntity(key,true,value);
      } else {
        _allTheme.add( ThemeEntity(key,false,value));
      }
    });
    _allTheme.insert(0, currentTheme);
  }
}