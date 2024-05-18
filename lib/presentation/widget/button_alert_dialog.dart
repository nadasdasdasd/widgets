import 'package:flutter/material.dart';

class ButtonAlertDialog extends StatefulWidget {
  const ButtonAlertDialog({super.key});

  @override
  State<ButtonAlertDialog> createState() => _ButtonAlertDialogState();
}

class _ButtonAlertDialogState extends State<ButtonAlertDialog> {
  @override
  Widget build(BuildContext context) {
    Future<void> showMyDialog() async {
      return showDialog<void>(
          context: context,
          barrierDismissible: true, // user can dismiss alert
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('alert!!!'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('This is demo alert dialog'),
                    Text('Would you like to approve this message'),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Approve'))
              ],
            );
          });
    }

    return GestureDetector(
      onTap: () => {showMyDialog()},
      child: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 8),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('Alert dialog'),
      ),
    );
  }
}
