import 'package:flutter/material.dart';
import 'package:flutter_provider_template/common/config/config.dart';
import 'package:flutter_provider_template/common/model/language/language_entity.dart';
import 'package:flutter_provider_template/common/model/language/language_key.dart';
import 'package:flutter_provider_template/common/utils/log_util.dart';
import 'package:flutter_provider_template/common/utils/storage_util.dart';

class LanguageNotifier extends ChangeNotifier {
  LanguageEntity _language = LanguageEntity("中文(简体)", "zh", "CN", true);

  LanguageEntity get language => _language;

  List<LanguageEntity> get allLanguage => _allLanguages;

  List<LanguageEntity> _allLanguages = List();

  LanguageNotifier() {
    getLanguage();
    initLanguageData();
  }

  Future getLanguage() async {
    String _language = await StorageManager.getInstance().get(Config.LANGUAGE_KEY);
    Log.i("App_Language", "= language=$_language'");
    if (_language != null && _language != "") {
      setLanguage(_language);
    }
  }

  Future setLanguage(language) async {
    _language = languageMap[language];
    if(_language==null){
      return;
    }
    await StorageManager.getInstance().save(Config.LANGUAGE_KEY, language);
    initLanguageData();
    notifyListeners();
  }

  initLanguageData() {
    _allLanguages.clear();
    LanguageEntity  languageEntity ;
    languageMap.forEach((key, value) {
      if (key == _language.name) {
        languageEntity = value;
        languageEntity.selected =true;
        _allLanguages.add(value);
      } else {
        languageEntity = value;
        languageEntity.selected =false;
        _allLanguages.add(value);
      }
    });
  }
}
