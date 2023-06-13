import 'package:flutter/cupertino.dart';

class CountProvider extends ChangeNotifier
{
  int count=0;
  void increment()
  {
    count++;
    notifyListeners();
  }
}