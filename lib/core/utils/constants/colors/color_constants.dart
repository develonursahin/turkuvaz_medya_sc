import 'package:flutter/material.dart';

class ColorConstant {
  static final ColorConstant _instance = ColorConstant.init();
  static ColorConstant get instance => _instance;
  ColorConstant.init();
  Color turkuaz = const Color.fromRGBO(9, 136, 173, 1);
  Color acikTurkuaz = const Color.fromARGB(255, 202, 231, 240);
}
