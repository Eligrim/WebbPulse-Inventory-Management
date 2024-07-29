import 'package:flutter/material.dart';

class SnackBarHelpers {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static Future<void> showSnackBarIfMounted(
      BuildContext context, String message) async {
    while (!context.mounted) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    if (context.mounted) {
      showSnackBar(context, message);
    }
  }
}
