import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nada_case5/reset_password.dart';
import 'package:nada_case5/theme_provider.dart';
import 'package:nada_case5/pass_provider.dart';

void main() {
  runApp(const ChangeNotifierExamplePage());
}

class ChangeNotifierExamplePage extends StatelessWidget {
  const ChangeNotifierExamplePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => PassChanger()),
      ],
      child: Consumer<ThemeChanger>(
        builder: (context, themeChanger, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeChanger.themeMode,
            home: ResetPasswordPage(),
          );
        },
      ),
    );
  }
}
