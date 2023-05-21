import 'package:flutter/material.dart';

class ToastComponent {
  static void show(BuildContext context, String message,
      {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor:
            isError ? const Color.fromARGB(255, 245, 102, 92) : Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
