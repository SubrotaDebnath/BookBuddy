import 'package:flutter/material.dart';

class EndListProgressIndicatorView extends StatelessWidget {
  const EndListProgressIndicatorView({
    super.key,
    required this.isEndOfPaginationLimit,
  });

  final bool isEndOfPaginationLimit;

  @override
  Widget build(BuildContext context) {
    if (isEndOfPaginationLimit) {
      return SizedBox();
    }
    return Container(
      padding: EdgeInsets.all(12),
      child: Center(
        child: SizedBox(
          height: 32,
          width: 32,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
