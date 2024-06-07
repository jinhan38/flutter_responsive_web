import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_subtitle.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_tablet_and_mobile.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_web.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/question_util.dart';
import 'package:flutter_responsive_web/util/screen_padding.dart';
import 'package:flutter_responsive_web/widgets/common_scaffold.dart';
import 'package:flutter_responsive_web/widgets/header.dart';

import '../../widgets/screen_layout_builder.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int selectedIndex = 0;
  late VoidCallback listener = () {
    setState(() {});
  };

  @override
  void initState() {
    QuestionUtil()
      ..initData()
      ..emailController.addListener(listener)
      ..nameController.addListener(listener)
      ..titleController.addListener(listener)
      ..contentController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    QuestionUtil().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        var width = MediaQuery.of(context).size.width;
        return CommonScaffold(
          currentIndex: 3,
          screenModel: screenModel,
          horizontalPadding: ScreenPadding.get(web, width),
          black: false,
          children: [
            Header(
              title: "온라인 문의",
              subTitle: "프로젝트 및 서비스 문의를 남겨주세요.",
              backgroundImage: AssetPath.questionHeaderImage,
              screenModel: screenModel,
            ),
            QuestionSubtitle(screenModel: screenModel),
            if (web) ...[
              const QuestionWeb(),
            ] else ...[
              const QuestionTabletAndMobile(),
            ],
          ],
        );
      },
    );
  }
}
