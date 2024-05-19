import 'package:flutter/material.dart';

class PassChanger with ChangeNotifier {
  final TextEditingController _oldPasswordController = TextEditingController();

  TextEditingController get oldPasswordController => _oldPasswordController;
  String _oldPassword = '';

  String get oldPassword => _oldPassword;

  String get getOldPassword => _oldPassword;
  void setOldPassword(String oldPassword) {
    _oldPassword = oldPassword;
    notifyListeners();
  }

  void clearPassword() {
    _oldPasswordController.clear();
    notifyListeners();
  }
}
