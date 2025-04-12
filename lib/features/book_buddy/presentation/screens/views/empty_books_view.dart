import 'package:flutter/material.dart';

class EmptyBooksView extends StatelessWidget {
  const EmptyBooksView({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
        child: Center(child: Text(message, textAlign: TextAlign.center)),
      ),
    );
  }
}
