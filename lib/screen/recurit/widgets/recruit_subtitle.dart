import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/model/screen_model.dart';
import 'package:flutter_responsive_web/util/my_color.dart';

class RecruitSubtitle extends StatelessWidget {
  const RecruitSubtitle({required this.screenModel, super.key});

  final ScreenModel screenModel;

  @override
  Widget build(BuildContext context) {
    var text1 = Text(
      "채용",
      style: TextStyle(
        fontSize: screenModel.web ? 24 : 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );

    var text2 = Text(
      "채용 포지션을 선택하고 채용정보를 확인해주세요",
      style: TextStyle(
        fontSize: screenModel.web ? 15 : 13,
        fontWeight: FontWeight.w500,
        color: MyColor.gray40,
      ),
    );

    if (screenModel.mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50),
          text1,
          const SizedBox(height: 5),
          text2,
        ],
      );
    }
    return Padding(
      padding: EdgeInsets.only(top: screenModel.web ? 96 : 54),
      child: Row(
        children: [
          text1,
          const SizedBox(width: 16),
          text2,
        ],
      ),
    );
  }
}
