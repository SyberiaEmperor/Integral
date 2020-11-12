import 'package:flutter/material.dart';

class ResponsiveSize {
  static double _width;
  static double _height;
  static void init({@required double height, @required double width}) {
    _width = width;
    _height = height;
  }

  static double width(num value) {
    return value * (_width / 375.0);
  }

  static double height(num value) {
    return value * (_height / 812.0);
  }
}

extension on num {
  num get w => ResponsiveSize.width(this);
  num get h => ResponsiveSize.height(this);
}
