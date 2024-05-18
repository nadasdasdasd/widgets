import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String textButton;
  final GestureTapCallback? onTap;
  const ButtonWidget({super.key, required this.textButton, required this.onTap});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 8),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.circular(8.0)),
        child: Text(widget.textButton),
      ),
    );
  }
}
