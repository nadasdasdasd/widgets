import 'package:flutter/material.dart';

class ButtonSnackbar extends StatefulWidget {
  final String textButton;
  final String textSnackbar;
  const ButtonSnackbar({super.key, required this.textButton, required this.textSnackbar});

  @override
  State<ButtonSnackbar> createState() => _ButtonSnackbarState();
}

class _ButtonSnackbarState extends State<ButtonSnackbar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text(widget.textSnackbar));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 8),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.circular(8.0)),
        child: Text(widget.textButton),
      ),
    );
  }
}
