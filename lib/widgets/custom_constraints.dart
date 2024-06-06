import 'package:flutter/material.dart';

class CustomConstraints extends StatelessWidget {
  const CustomConstraints({
    required this.backgroundColor,
    required this.maxWidth,
    required this.child,
    super.key,
  });

  final Color backgroundColor;
  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
