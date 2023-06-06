import 'dart:async';

import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int providerValue = 10;
  int start = 0;
  String msg = "Code with Flutter";

  void update(int providerValue) {
    this.providerValue = providerValue;
    notifyListeners();
  }

  void updateStart(int start) {
    this.start = start;
    notifyListeners();
  }

  void getTimer() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) => updateStart(timer.tick),
    );
  }

  ///Provider with Async
  void updateMsg(String msg) {
    this.msg = msg;
    notifyListeners();
  }

  Future<void> getName() async {
    Future.delayed(
      Duration(seconds: 5),
      () => updateMsg("Hello World"),
    );
  }
}
