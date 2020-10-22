import 'package:flutter/material.dart';
import 'package:flutter_provider_template/common/widget/sm_titlebar_widget.dart';

class DebugPage extends StatefulWidget {
  static final String sName = "DebugPage";

  @override
  _DebugPageState createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  OverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMTitleBarWidget(
        title: 'Debug',
      ),
      body: ListView(children: <Widget>[]),
    );
  }
}
