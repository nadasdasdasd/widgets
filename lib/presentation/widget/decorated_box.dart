import 'package:flutter/material.dart';

class DecoratedBoxWidget extends StatefulWidget {
  const DecoratedBoxWidget({super.key});

  @override
  State<DecoratedBoxWidget> createState() => _DecoratedBoxWidgetState();
}

class _DecoratedBoxWidgetState extends State<DecoratedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            gradient: RadialGradient(
              center: Alignment(-0.5, -0.6),
              radius: 0.15,
              colors: <Color>[
                Color.fromARGB(255, 162, 19, 19),
                Color.fromARGB(255, 47, 47, 214),
              ],
              stops: <double>[0.9, 1.0],
            )));
  }
}
