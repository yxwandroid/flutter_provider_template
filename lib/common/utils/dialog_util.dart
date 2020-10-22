import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_template/common/style/SMColors.dart';
import 'package:flutter_provider_template/generated/l10n.dart';

class DialogUtil{
 static Future<void> showTextFieldAlertDialog(context,String title,) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return new CupertinoAlertDialog(
            title:  new Container(
              child: Text("xxx:"),
            ),
            content: Card(
              child: TextField(
//                maxLength: 3,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderSide:  BorderSide(color: SMColors.bgColorf2f4f8)
                    )
                ),

              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(
                  S.of(context).cancel,
                  style: TextStyle(color: Color(0xff181830)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: Text( S.of(context).ok,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}