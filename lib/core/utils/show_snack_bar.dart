import 'package:flutter/material.dart';

void showSuccessSnackBar(String message, BuildContext context) {
  _showCustomSnackBar(
    message: message,
    context: context,
    backgroundColor: Colors.green,
  );
}

void showErrorSnackBar(String message, BuildContext context) {
  _showCustomSnackBar(
    message: message,
    context: context,
    backgroundColor: Colors.red,
  );
}

void _showCustomSnackBar({
  required String message,
  required BuildContext context,
  required Color backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating, // Optional: Floating style
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
