import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool visible = false;

  void init() {
    visible = true;
    notifyListeners();
  }
}
