import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier{

  ThemeData themeData;
  final bool isMode;
  
  ThemeChanger({required this.themeData,required this.isMode});

  // ThemeData get  themeData => _themeData;

  void setThemeData(ThemeData themeData) {
    themeData = themeData;
    notifyListeners();
  }

  set isMode(bool isMode) => isMode = isMode;
}