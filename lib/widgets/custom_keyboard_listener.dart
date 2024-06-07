import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomKeyboardListener extends StatefulWidget {
  const CustomKeyboardListener(
      {required this.child, required this.scrollController, super.key});

  final Widget child;
  final ScrollController scrollController;

  @override
  State<CustomKeyboardListener> createState() => _CustomKeyboardListenerState();
}

class _CustomKeyboardListenerState extends State<CustomKeyboardListener> {
  final focusNode = FocusNode();
  final duration = const Duration(milliseconds: 200);
  double offset = 0;

  @override
  void dispose() {
    focusNode
      ..unfocus()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    offset = MediaQuery.of(context).size.height;
    return KeyboardListener(
      focusNode: focusNode,
      autofocus: true,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.pageUp) {
            move(true);
          } else if (event.logicalKey == LogicalKeyboardKey.pageDown) {
            move(false);
          } else if (event.logicalKey == LogicalKeyboardKey.home) {
            home();
          } else if (event.logicalKey == LogicalKeyboardKey.end) {
            end();
          }
        }
        print('event : $event');
      },
      child: widget.child,
    );
  }

  void move(bool pageUp) {
    final moveOffset = pageUp
        ? widget.scrollController.offset - offset
        : widget.scrollController.offset + offset;
    widget.scrollController.animateTo(
      moveOffset,
      duration: duration,
      curve: Curves.easeInOut,
    );
  }

  void home() {
    widget.scrollController
        .animateTo(0, duration: duration, curve: Curves.easeInOut);
  }

  void end() {
    widget.scrollController.animateTo(
        widget.scrollController.position.extentTotal,
        duration: duration,
        curve: Curves.easeInOut);
  }
}
