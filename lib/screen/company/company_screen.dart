import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/screen/company/widgets/company_slogan.dart';
import 'package:flutter_responsive_web/util/screen_padding.dart';
import 'package:flutter_responsive_web/widgets/common_scaffold.dart';
import 'package:flutter_responsive_web/widgets/header.dart';
import 'package:flutter_responsive_web/widgets/menu/menu.dart';
import 'package:flutter_responsive_web/widgets/page_drawer.dart';
import 'package:flutter_responsive_web/widgets/screen_layout_builder.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        final screenWidth = MediaQuery
            .of(context)
            .size
            .width;
        return CommonScaffold(
          currentIndex: 0,
          screenModel: screenModel,
          horizontalPadding: ScreenPadding.get(web, screenWidth),
          children: [
            Header(title: "당신의 꿈과 가치가 현실이 되는 곳",
                subTitle: "IT 서비스가 처음이더라도\n샐링잇이 함께 성장하도록 이끌겠습니다.",
                backgroundImage: "",
                titleColor: Colors.black,
                subTitleColor: Colors.black,
                screenModel: screenModel),
            CompanySlogan(web: web),
          ],
        );
      },
    );
  }
}
