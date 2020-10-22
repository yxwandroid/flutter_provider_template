import 'package:flutter/material.dart';

class ColorUtil {
  static HSV hex2HSV(Color color) {
    int red = color.red;
    int green = color.green;
    int blue = color.blue;
    var hslColor = HSLColor.fromColor(color);
    double hue = hslColor.hue;
    double saturation = hslColor.saturation;
    double lightness = hslColor.lightness;
    return HSV(hue, saturation, lightness);
  }
}

class HSV {
  double hue;
  double saturation;
  double lightness;

  HSV(this.hue, this.saturation, this.lightness);

  @override
  String toString() {
    return 'HSV{hue: $hue, saturation: $saturation, lightness: $lightness}';
  }
}
