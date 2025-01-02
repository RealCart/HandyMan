import 'package:flutter/material.dart';

class BottomBarIndex extends ChangeNotifier {
  int index;
  bool navigated;

  BottomBarIndex({
    this.index = 0,
    this.navigated = false,
  });

  void changeBarIndex({
    required int newIndex,
  }) async {
    index = newIndex;
    notifyListeners();
  }
}
