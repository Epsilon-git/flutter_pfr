import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Widget child;
  final double width;

  const MyContainer({
    super.key,
    required this.child,
    this.width = 600,
  });

  static EdgeInsetsGeometry getPadding(
    BuildContext context, [
    double width = 600,
  ]) {
    final padding = (MediaQuery.of(context).size.width - width) / 2;

    return EdgeInsets.symmetric(
      horizontal: (padding <= 0) ? 16 : padding,
      vertical: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = (MediaQuery.of(context).size.width - width) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (padding <= 0) ? 16 : padding,
        vertical: 16,
      ),
      child: child,
    );
  }
}
