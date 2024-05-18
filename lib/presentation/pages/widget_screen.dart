import 'package:flutter/material.dart';
import 'package:widgets/presentation/widget/button.dart';
import 'package:widgets/presentation/widget/button_alert_dialog.dart';
import 'package:widgets/presentation/widget/button_snackbar.dart';
import 'package:widgets/presentation/widget/dismissable.dart';

class MyWidgetPage extends StatefulWidget {
  const MyWidgetPage({super.key});

  @override
  State<MyWidgetPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Interaction widgets"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            const ButtonSnackbar(
              textButton: "Snackbar",
              textSnackbar: "tap!",
            ),
            const ButtonAlertDialog(),
            const DismissibleWidget(),
            ButtonWidget(
                textButton: 'login form',
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                }),
            ButtonWidget(
                textButton: 'loaders',
                onTap: () {
                  Navigator.pushNamed(context, '/loaders');
                }),
            ButtonWidget(
                textButton: 'paint widget',
                onTap: () {
                  Navigator.pushNamed(context, '/paint');
                })
          ]),
        ));
  }
}
