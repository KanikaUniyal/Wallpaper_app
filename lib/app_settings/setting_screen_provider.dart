import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  bool _isDataUsageSwitched = false;
  bool _isWallpaperSettingSwitched = false;
  bool _isPushNotificationsSwitched = false;

  // Getters
  bool get isDataUsageSwitched => _isDataUsageSwitched;
  bool get isWallpaperSettingSwitched => _isWallpaperSettingSwitched;
  bool get isPushNotificationsSwitched => _isPushNotificationsSwitched;

  // Setters
  void toggleDataUsage(bool value) {
    _isDataUsageSwitched = value;
    notifyListeners();
  }

  void toggleWallpaperSetting(bool value) {
    _isWallpaperSettingSwitched = value;
    notifyListeners();
  }

  void togglePushNotifications(bool value) {
    _isPushNotificationsSwitched = value;
    notifyListeners();
  }
}
