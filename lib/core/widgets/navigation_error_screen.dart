import 'package:flutter/material.dart';

class NavigationErrorScreen extends StatelessWidget {
  const NavigationErrorScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    body: const Center(
      child: Text(
        'Navigation Error\nGo Back and Try Again.',
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.5,
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  );
}