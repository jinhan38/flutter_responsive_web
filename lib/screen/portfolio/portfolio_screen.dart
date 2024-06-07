import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/route_page.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/screen_padding.dart';
import 'package:flutter_responsive_web/widgets/common_scaffold.dart';
import 'package:flutter_responsive_web/widgets/header.dart';
import 'package:flutter_responsive_web/widgets/page_drawer.dart';
import 'package:flutter_responsive_web/widgets/screen_layout_builder.dart';

import '../../widgets/menu/menu.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final List<String> imageList = [
    AssetPath.bird,
    AssetPath.butterfly,
    AssetPath.flutter,
    AssetPath.office,
    AssetPath.office_2,
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        var screenWidth = MediaQuery.of(context).size.width;
        return CommonScaffold(
          currentIndex: 1,
          screenModel: screenModel,
          horizontalPadding: ScreenPadding.get(web, screenWidth),
          children: [
            Header(
              title: "포트폴리오",
              subTitle:
                  "샐링잇은 모바일, 웹, 어드민 뿐만 아니라\n여러 디바이스 환경에 맞는 개발 환경과 디자인을 제안합니다.",
              backgroundImage: "",
              screenModel: screenModel,
              titleColor: Colors.black,
              subTitleColor: Colors.black,
            ),
            SizedBox(
              width: screenWidth,
              height: 1,
              child: OverflowBox(
                maxWidth: screenWidth,
                maxHeight: 1,
                child: Container(
                  width: screenWidth,
                  height: 1,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: MyColor.gray20,
                        blurRadius: 7,
                        spreadRadius: 3,
                        offset: Offset(0, -5),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: web ? 2 : 1,
              shrinkWrap: true,
              childAspectRatio: 1.2,
              children: List.generate(
                imageList.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      RoutePage.movePage(context, RoutePage.portfolioDetail);
                    },
                    child: Image.asset(
                      imageList[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 150),
          ],
        );
      },
    );
  }
}
