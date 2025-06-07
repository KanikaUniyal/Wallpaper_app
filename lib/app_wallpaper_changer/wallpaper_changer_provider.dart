import 'package:flutter/material.dart';

class WallpaperChangerProvider with ChangeNotifier {
  int _selectedIndex = 0;
  int _selectedScreenIndex = 1;

  final List<String> timeIntervals = ['15 min', '30 min', '1h', '2h', '4h', '6h', '12h', '24h'];
  final List<String> screenIntervals = ['lock', 'home', 'both'];

  int get selectedIndex => _selectedIndex;
  int get selectedScreenIndex => _selectedScreenIndex;

  String get selectedTime => timeIntervals[_selectedIndex];
  String get selectedScreen => screenIntervals[_selectedScreenIndex];

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void updateSelectedScreenIndex(int index) {
    _selectedScreenIndex = index;
    notifyListeners();
  }
}
