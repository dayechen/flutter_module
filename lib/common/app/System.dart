import 'package:flutter/cupertino.dart';

class SysUtil {
  static double _screenWidth;
  static double _topHeight;
  static double _screenHeight;

  static void init(BuildContext context) {
    final media = MediaQuery.of(context);
    _screenWidth = media.size.width;
    _screenHeight = media.size.height;
    _topHeight = media.padding.top;
  }

  static double rpx(double num) {
    return num * (_screenWidth / 750);
  }

  static double getTopHeight() {
    return _topHeight;
  }

  static double getScreenHeight() {
    return _screenHeight;
  }
}
