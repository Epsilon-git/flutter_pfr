import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Widget child;

  const MyContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final padding = (MediaQuery.of(context).size.width - 600) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (padding <= 0) ? 16 : padding,
        vertical: 16,
      ),
      child: child,
    );
  }
}
