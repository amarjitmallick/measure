import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  Future<void> updateTabIndex(int selectedIndex) async {
    _tabIndex = selectedIndex;
    notifyListeners();
  }
}
