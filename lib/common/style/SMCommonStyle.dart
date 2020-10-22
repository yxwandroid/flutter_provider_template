import 'package:flutter/material.dart';

import 'SMColors.dart';

class SMCommonStyle {
  static BorderRadius borderRadius5 = BorderRadius.all(Radius.circular(5.0));
  static BorderRadius borderRadius10 = BorderRadius.all(Radius.circular(10.0));
  static BorderRadius borderRadius16 = BorderRadius.all(Radius.circular(16.0));
  static BorderRadius borderRadius20 = BorderRadius.all(Radius.circular(20.0));
  static EdgeInsets paddingHori10Vert5 =
  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0);
  static EdgeInsets paddingHori25Vert20 =
  EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0);
  static EdgeInsets paddingHori25Vert10 =
  EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0);
  static EdgeInsets paddingHori10Vert20 =
  EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0);
  static EdgeInsets paddingHori10Vert15 =
  EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0);
  static EdgeInsets paddingHori15Vert10 =
  EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0);
  static EdgeInsets paddingHori15Vert8 =
  EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0);
  static EdgeInsets paddingHori15Vert5 =
  EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0);
  static EdgeInsets paddingHori20Vert15 =
  EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0);
  static EdgeInsets paddingHori15Vert12 =
  EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0);
  static EdgeInsets paddingHori10 = EdgeInsets.symmetric(horizontal: 10.0);
  static EdgeInsets paddingHori15 = EdgeInsets.symmetric(horizontal: 15.0);
  static EdgeInsets paddingHori20 = EdgeInsets.symmetric(horizontal: 20.0);
  static EdgeInsets paddingHori25 = EdgeInsets.symmetric(horizontal: 25.0);
  static EdgeInsets paddingHori15Top10 =
  EdgeInsets.only(left: 15.0, right: 15.0, top: 10);
  static EdgeInsets paddingHori15Top15Bottom10 =
  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 10);
  static EdgeInsets paddingTop15Bottom10 = EdgeInsets.only(top: 15, bottom: 10);
  static EdgeInsets paddingTop10Bottom15 = EdgeInsets.only(top: 10, bottom: 15);
  static EdgeInsets paddingVert12 = EdgeInsets.symmetric(vertical: 12.0);
  static EdgeInsets paddingVert10 = EdgeInsets.symmetric(vertical: 10.0);
  static EdgeInsets paddingVert15 = EdgeInsets.symmetric(vertical: 15.0);
  static EdgeInsets paddingVert20 = EdgeInsets.symmetric(vertical: 20.0);
  static EdgeInsets paddingVert5 = EdgeInsets.symmetric(vertical: 5.0);
  static EdgeInsets paddingVert7 = EdgeInsets.symmetric(vertical: 7.0);
  static EdgeInsets padding5 = EdgeInsets.all(5.0);
  static EdgeInsets padding10 = EdgeInsets.all(10.0);
  static EdgeInsets paddingHor48 = EdgeInsets.symmetric(horizontal: 48.0);
  static EdgeInsets padding15 = EdgeInsets.all(15.0);
  static EdgeInsets padding15Left = EdgeInsets.only(left: 15.0);
  static EdgeInsets padding20 = EdgeInsets.all(20.0);
  static EdgeInsets btnPadding = EdgeInsets.symmetric(
      horizontal: 10.0, vertical: 5.0);
  static Border border05White = Border.all(width: 0.5, color: SMColors.white);
  static Border border051e1e1e =
  Border.all(width: 0.5, color: SMColors.colore1e1e1);
  static Border border05979797 =
  Border.all(width: 0.5, color: SMColors.color979797);
  static Border borderBottom03Gray =
  Border(bottom: BorderSide(width: 0.3, color: SMColors.grayLineColor));
  static Border borderBottom05Colordadada =
  Border(bottom: BorderSide(width: 0.5, color: SMColors.coloredadada));
  static Border borderBottom05Color1e1e1e =
  Border(bottom: BorderSide(width: 0.5, color: SMColors.colore1e1e1));
  static Border borderTop05Color1e1e1e =
  Border(top: BorderSide(width: 0.5, color: SMColors.colore1e1e1));
  static Border borderTopBottom05Color1e1e1e = Border(
      bottom: BorderSide(width: 0.5, color: SMColors.colore1e1e1),
      top: BorderSide(width: 0.5, color: SMColors.colore1e1e1));
  static Border borderTop05Gray =
  Border(top: BorderSide(width: 0.5, color: SMColors.grayLineColor));
  static Border borderBottom03Transparent =
  Border(bottom: BorderSide(width: 0.3, color: SMColors.transparent));
}
