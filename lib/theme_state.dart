import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  late Color _scaffOldColor;

  ThemeState({Color? color}) {
    if (color != null) {
      _scaffOldColor = color;
    } else {
      _scaffOldColor = Colors.white;
    }
  }

  void change(Color color) {
    _scaffOldColor = color;
    notifyListeners();
  }

  Color get scaffoldColor => _scaffOldColor;
}
