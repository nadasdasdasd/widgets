import 'package:flutter/material.dart';
import 'package:nada_case5/pass_provider.dart';
import 'package:nada_case5/setting.dart';
import 'package:nada_case5/theme_provider.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final passChanger = Provider.of<PassChanger>(context);
    bool _validateInputs(BuildContext context) {
      if (passChanger.oldPasswordController.text.isEmpty ||
          _newPasswordController.text.isEmpty ||
          _confirmPasswordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill in all fields.')),
        );
        return false;
      }
      if (_confirmPasswordController.text != _newPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match.')),
        );
        return false;
      }
      return true;
    }

    // _oldPasswordController.text = passChanger.getOldPassword;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(themeChanger.avatarAsset),
            ),
            SizedBox(height: 20.0),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: passChanger.oldPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Old Password',
                    ),
                    onChanged: (text) {
                      passChanger.oldPasswordController.text = text;
                    },
                    obscureText: false,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Old password can\'t be empty.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _newPasswordController,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                    ),
                    obscureText: true,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'New password can\'t be empty.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirm New Password',
                    ),
                    obscureText: true,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm new password can\'t be empty.';
                      }
                      if (value != _newPasswordController.text) {
                        return 'Passwords do not match.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_validateInputs(context)) {
                  passChanger.clearPassword();

                  // Reset text fields
                  _newPasswordController.clear();
                  _confirmPasswordController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password has been reset.')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeChanger.themeMode == ThemeMode.light ? Colors.blue : Colors.white,
                foregroundColor:
                    themeChanger.themeMode == ThemeMode.light ? Colors.white : Colors.black, // Use dynamic button color
              ),
              child: Text('Update Password'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingPage()),
          );
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}
