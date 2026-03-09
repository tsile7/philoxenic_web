import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool visible = false;

  void init() {
    visible = true;
    notifyListeners();
  }
}

class FooterLink {
  final String title;
  final String route;

  FooterLink(this.title, this.route);
}