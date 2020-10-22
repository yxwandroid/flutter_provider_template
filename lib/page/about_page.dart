/*
 * Copyright (c) 2020. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter/material.dart';
import 'package:flutter_provider_template/common/style/SMAppBar.dart';
import 'package:flutter_provider_template/common/style/SMTxtStyle.dart';
import 'package:flutter_provider_template/generated/l10n.dart';
import '../res.dart';

class AboutPage extends StatefulWidget {
  static final String sName = "AboutPage";

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMAppBar.getAppBar(S.of(context).about),
      body: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child:RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 20),
                children: [
                  TextSpan(
                      text: "3333",
                      style: SMTxtStyle.color333333dp26
                  ),

                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
