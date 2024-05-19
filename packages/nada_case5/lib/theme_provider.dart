import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _avatarAsset = 'assets/images/hcid.png';

  ThemeMode get themeMode => _themeMode;
  String get avatarAsset => _avatarAsset;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _avatarAsset = _themeMode == ThemeMode.light
        ? 'assets/images/hcid.png'
        : 'assets/images/hci_black_white.jpg';
    notifyListeners();
  }
}
