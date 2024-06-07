import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.label,
    required this.textStyle,
    required this.size,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.radius = 10,
    this.backgroundColor = Colors.transparent,
    super.key,
  });

  final String label;
  final TextStyle textStyle;
  final Size size;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: size,
        maximumSize: size,
        fixedSize: size,
        padding: padding,
        backgroundColor: onPressed == null ? null : backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
