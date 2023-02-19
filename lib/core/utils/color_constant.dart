import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray500 = fromHex('#979797');

  static Color black900 = fromHex('#000000');

  static Color amber500 = fromHex('#f5be18');

  static Color gray900 = fromHex('#1a1b20');

  static Color orange700 = fromHex('#e77d00');

  static Color deepPurpleA200 = fromHex('#864afc');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray100 = fromHex('#f6f6f6');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
