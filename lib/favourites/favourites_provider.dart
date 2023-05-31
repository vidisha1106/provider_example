import 'package:flutter/foundation.dart';

class FavouritesProvider extends ChangeNotifier {
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void additem(int value) {
    selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    selectedItem.remove(value);
    notifyListeners();
  }
}
