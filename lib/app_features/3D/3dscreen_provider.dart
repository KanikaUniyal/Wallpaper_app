import 'package:flutter/material.dart';

class SelectedTabProvider with ChangeNotifier {
  String _selectedTab = 'NEW';

  String get selectedTab => _selectedTab;

  // Method to change the selected tab
  void selectTab(String tab) {
    _selectedTab = tab;
    notifyListeners();
  }
}
