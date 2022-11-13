import 'package:flutter/material.dart';

Future<void> showErrDialog(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("an error occured"),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(); //!!!better to use overlays for some types of error.
            },
            child: const Text('OK'), //?
          ),
        ],
      );
    },
  );
}
