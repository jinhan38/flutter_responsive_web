import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/model/screen_model.dart';
import 'package:flutter_responsive_web/widgets/custom_keyboard_listener.dart';
import 'package:flutter_responsive_web/widgets/footer.dart';
import 'package:flutter_responsive_web/widgets/menu/menu.dart';
import 'package:flutter_responsive_web/widgets/page_drawer.dart';

class CommonScaffold extends StatefulWidget {
  const CommonScaffold({
    required this.currentIndex,
    required this.screenModel,
    required this.children,
    this.black = true,
    this.horizontalPadding = 0,
    super.key,
  });

  final int currentIndex;
  final ScreenModel screenModel;
  final List<Widget> children;
  final bool black;
  final double horizontalPadding;

  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.children.add(const Footer());
    return Scaffold(
      endDrawer: PageDrawer(
        currentIndex: widget.currentIndex,
        tablet: widget.screenModel.tablet,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomKeyboardListener(
              scrollController: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                padding:
                    EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
                child: Column(
                  children: widget.children,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Menu(
              currentIndex: widget.currentIndex,
              screenModel: widget.screenModel,
              black: widget.black,
            ),
          ),
        ],
      ),
    );
  }
}
