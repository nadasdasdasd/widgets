import 'package:flutter/material.dart';

class InkWellWidget extends StatefulWidget {
  const InkWellWidget({super.key});

  @override
  State<InkWellWidget> createState() => _InkWellWidgetState();
}

class _InkWellWidgetState extends State<InkWellWidget> {
  Image img = Image.network(
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80');
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink.image(
        fit: BoxFit.fill,
        image: img.image,
        width: 300,
        height: 300,
        child: const Align(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'puffin',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
        )),
      ),
    );
  }
}
