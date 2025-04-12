import 'package:flutter/material.dart';

class GlobalSnackBar {
  const GlobalSnackBar({
    required this.message,
  });

  final String message;

  static show({
    required BuildContext context,
    required String message,
    int duration = 2,
    Color color = Colors.black87,
    String label = 'ok',
    VoidCallback? onPressed,
    TextStyle textStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    TextAlign textAlign = TextAlign.center,
  }) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: color,
          elevation: 5,
          behavior: SnackBarBehavior.floating,
          showCloseIcon: onPressed == null,
          content: Text(
            message,
            textAlign: textAlign,
            style: textStyle,
          ),
          action: onPressed == null
              ? null
              : SnackBarAction(
            label: label,
            onPressed: onPressed,
          ),
          duration: Duration(
            seconds: duration,
          ),
        ),
      );
  }
}