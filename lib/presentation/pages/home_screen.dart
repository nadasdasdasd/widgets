import 'package:flutter/material.dart';
import 'package:widgets/data/models/menu_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<MenuItem> menuItems = [
    MenuItem(
      title: 'widget',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: ((context, index) {
              return Column(
                children: <Widget>[buildMenuItem(menuItems[index]), if (index < menuItems.length - 1) const Divider()],
              );
            })));
  }

  Widget buildMenuItem(MenuItem item) {
    return ListTile(
      title: Text(item.title),
      onTap: () {
        if (item.title == 'widget') {
          Navigator.pushNamed(context, '/widget');
        }
      },
    );
  }
}
