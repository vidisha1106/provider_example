import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

 var _themeMode= ThemeMode.light;
 ThemeMode get themeMode=> _themeMode;

  void changeTheme(themeMode)
  {
   _themeMode=themeMode;
   notifyListeners();
  }
}