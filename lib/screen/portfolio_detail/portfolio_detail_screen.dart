import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/route_page.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/screen_padding.dart';
import 'package:flutter_responsive_web/util/text_util.dart';
import 'package:flutter_responsive_web/widgets/common_scaffold.dart';
import 'package:flutter_responsive_web/widgets/screen_layout_builder.dart';

class PortfolioDetailScreen extends StatefulWidget {
  const PortfolioDetailScreen({super.key});

  @override
  State<PortfolioDetailScreen> createState() => _PortfolioDetailScreenState();
}

class _PortfolioDetailScreenState extends State<PortfolioDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        var screenWidth = MediaQuery.of(context).size.width;
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenPadding.get(web, screenWidth)),
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Text(
                        "상세 이미지",
                        style: TextUtil.get20(context, Colors.black),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          RoutePage.backPage(context);
                        },
                        customBorder: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Icon(Icons.close, size: 36),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    children: [
                      Image.asset(AssetPath.detail1, fit: BoxFit.cover),
                      Image.asset(AssetPath.detail2, fit: BoxFit.cover),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
