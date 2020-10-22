import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_template/common/model/theme/theme_entity.dart';
import 'package:flutter_provider_template/common/style/SMAppBar.dart';
import 'package:flutter_provider_template/common/style/SMColors.dart';
import 'package:flutter_provider_template/common/style/SMTxtStyle.dart';
import 'package:flutter_provider_template/navigator_utils.dart';
import 'package:flutter_provider_template/generated/l10n.dart';
import 'package:flutter_provider_template/notifier/theme_notifier.dart';
import 'package:flutter_provider_template/res.dart';

import 'language_page.dart';

class SettingPage extends StatefulWidget {
  static final String sName = "SettingPage";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController textEditingController = TextEditingController();

  String blueToothName="";

  @override
  void initState() {
    super.initState();
  }


  Widget _buildItem(ThemeEntity e) {
    if (e.selected) {
      return buildCurrentThemeItem(e);
    } else {
      return buildThemeItem(e);
    }
  }

  Widget buildThemeItem(ThemeEntity e) {
    return FlatButton(
      onPressed: () {
        Provider.of<ThemeNotifier>(context, listen: false).setTheme(e.themeName);
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Color(e.themeColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: SMColors.textColorB6B6B6),
        ),
      ),
    );
  }

  Widget buildCurrentThemeItem(ThemeEntity e) {
    return FlatButton(
      onPressed: () {
        Provider.of<ThemeNotifier>(context, listen: false).setTheme(e.themeName);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color(e.themeColor),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 10, color: SMColors.coloredadada),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SMAppBar.getAppBar(S.of(context).setting),
        body: Container(
          child: Consumer<ThemeNotifier>(builder: (context, counter, _) {
            var themeNotifier = Provider.of<ThemeNotifier>(context);
            List<ThemeEntity> allTheme = themeNotifier.allTheme;
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    width: 200,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          Res.icon_language,
                          width: 24,
                          height: 24,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            S.of(context).language,
                            style: SMTxtStyle.color333333dp15,
                          ),
                        )
                      ],
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    NavigatorUtils.getInstance().pushNamed(context, LanguagePage.sName);
                  },
                ),
                ExpansionTile(
                  title: Text(""),
                  initiallyExpanded: false,
                  children: [
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: allTheme.map<Widget>(_buildItem).toList(),
                    )
                  ],
                  leading: Container(
                    width: 200,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          Res.icon_theme,
                          width: 24,
                          height: 24,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            S.of(context).theme,
                            style: SMTxtStyle.color333333dp15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
