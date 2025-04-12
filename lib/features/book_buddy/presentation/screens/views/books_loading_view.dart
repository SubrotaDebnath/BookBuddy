import 'package:flutter/material.dart';

class BooksLoadingView extends StatelessWidget {
  const BooksLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
