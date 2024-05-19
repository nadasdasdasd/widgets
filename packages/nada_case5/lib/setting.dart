import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nada_case5/theme_provider.dart';
import 'package:nada_case5/pass_provider.dart';
import 'package:nada_case5/reset_password.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  @override
  void dispose() {
    _oldPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final passChanger = Provider.of<PassChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _oldPasswordController.text = passChanger.getOldPassword;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordPage(),
                  ),
                );
              },
              child: Text('Toggle Old Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                themeChanger.toggleTheme();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordPage(),
                  ),
                );
              },
              child: Text('Toggle Theme'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordPage(),
                  ),
                );
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
