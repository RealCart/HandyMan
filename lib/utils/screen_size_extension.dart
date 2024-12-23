import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  double heightPercent(double pixels) {
    double percent = pixels / 844;
    return MediaQuery.of(this).size.height * percent;
  }

  double widthPercent(double pixels) {
    double percent = pixels / 390;
    return MediaQuery.of(this).size.width * percent;
  }
}
