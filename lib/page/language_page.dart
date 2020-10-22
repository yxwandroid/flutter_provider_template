import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_template/common/style/SMAppBar.dart';
import 'package:flutter_provider_template/common/style/SMColors.dart';
import 'package:flutter_provider_template/common/style/SMTxtStyle.dart';
import 'package:flutter_provider_template/generated/l10n.dart';
import 'package:flutter_provider_template/notifier/language_notifier.dart';
import 'package:flutter_provider_template/res.dart';

class LanguagePage extends StatefulWidget {
  static final String sName = "LanguagePage";

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMAppBar.getAppBar(S.of(context).language),
      body: Container(
        child: Consumer<LanguageNotifier>(builder: (context, counter, _) {
          var languageNotifier = Provider.of<LanguageNotifier>(context);
          var allLanguage = languageNotifier.allLanguage;
          return ListView.separated(
            itemCount: allLanguage.length,
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Provider.of<LanguageNotifier>(context, listen: false)
                      .setLanguage(allLanguage[index].name);
                },
                leading: Container(
                    width: 90,
                    child: Text(allLanguage[index].name,style: SMTxtStyle.color333333dp15,)),
                trailing: allLanguage[index].selected
                    ? Container(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          Res.check,
                        ))
                    : Container(width: 20, height: 20, child: Text("")),
              );
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return Divider(color: SMColors.color979797);
            },
          );
        }),
//        child: Center(child: FlatButton(
//            onPressed: (){
////              login();
//              Provider.of<LanguageNotifier>(context, listen: false)
//                  .setLanguage("中文()");
//            },
//            child: Text("wilson"))),
      ),
    );
  }
}
