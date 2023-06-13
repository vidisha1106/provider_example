import 'package:flutter/foundation.dart';
import 'package:provider_example/ProxyProvider2/count_provider.dart';

class Msg extends ChangeNotifier {
  List countValues = [];

  void showMsg(int count) {
    countValues.add(count);
    notifyListeners();
  }
}
