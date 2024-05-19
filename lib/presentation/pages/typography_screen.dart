import 'package:flutter/material.dart';

class TypographyPage extends StatefulWidget {
  const TypographyPage({super.key});

  @override
  State<TypographyPage> createState() => _TypographyPageState();
}

class _TypographyPageState extends State<TypographyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('paint'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                'Small caps',
                style: TextStyle(fontSize: 20, fontFeatures: [FontFeature.enable('smcp')]),
              ),
              const Text(
                'Small caps 1/2',
                style: TextStyle(fontSize: 20, fontFeatures: [FontFeature.enable('smcp'), FontFeature.enable('frac')]),
              ),
              Text(
                ' comicate COmicateee 9121',
                style: TextStyle(fontSize: 20, fontFamily: 'Gabriola', fontFeatures: [FontFeature.stylisticSet(5)]),
              )
            ],
          ),
        ));
  }
}
