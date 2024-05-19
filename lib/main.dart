import 'package:flutter/material.dart';
import 'package:nada_case5/main.dart';
import 'package:widgets/presentation/pages/api_screen.dart';
import 'package:widgets/presentation/pages/home_screen.dart';
import 'package:widgets/presentation/pages/loaders_screen.dart';
import 'package:widgets/presentation/pages/login_screen.dart';
import 'package:widgets/presentation/pages/not_found_screen.dart';
import 'package:widgets/presentation/pages/paint_widget_screen.dart';
import 'package:widgets/presentation/pages/typography_screen.dart';
import 'package:widgets/presentation/pages/widget_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp(
    title: "mini project",
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.title});

  final String title;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/widget': (context) => const MyWidgetPage(),
        '/login': (context) => const LoginPage(),
        '/loaders': (context) => const LoadersPage(),
        '/paint': (context) => const PaintWidgetPage(),
        '/typography': (context) => const TypographyPage(),
        '/apiPage': (context) => const ApiPage(),
        '/changeNotifier': (context) => const ChangeNotifierExamplePage()
      },
      onGenerateRoute: (settings) {
        // Handle unknown routes
        if (settings.name == '/widget') {
          return MaterialPageRoute(builder: (context) => const MyWidgetPage());
        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      },
    );
  }
}
