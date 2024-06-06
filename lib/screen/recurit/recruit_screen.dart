import 'package:flutter/material.dart';

import '../../widgets/menu/menu.dart';
import '../../widgets/page_drawer.dart';
import '../../widgets/screen_layout_builder.dart';

class RecruitScreen extends StatefulWidget {
  const RecruitScreen({super.key});

  @override
  State<RecruitScreen> createState() => _RecruitScreenState();
}

class _RecruitScreenState extends State<RecruitScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        return Scaffold(
          endDrawer: PageDrawer(currentIndex: 2, tablet: tablet),
          body: Column(
            children: [
              Menu(
                currentIndex: 2,
                screenModel: screenModel,
              ),
            ],
          ),
        );
      },
    );
  }
}
