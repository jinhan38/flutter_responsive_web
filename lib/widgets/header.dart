import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/model/screen_model.dart';

import '../util/text_util.dart';

class Header extends StatelessWidget {
  const Header({
    required this.title,
    required this.subTitle,
    required this.backgroundImage,
    required this.screenModel,
    super.key,
  });

  final String title;
  final String subTitle;
  final String backgroundImage;
  final ScreenModel screenModel;

  @override
  Widget build(BuildContext context) {
    var height = setHeight();
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height,
      child: OverflowBox(
        maxHeight: height,
        maxWidth: width,
        child: Container(
          width: width,
          height: height,
          decoration: backgroundImage.isEmpty
              ? null
              : BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(backgroundImage).image,
                    fit: BoxFit.cover,
                  ),
                ),
          child: Column(
            children: [
              SizedBox(height: topPadding()),
              if (title.isNotEmpty) ...[
                Text(
                  title,
                  style: TextUtil.get20(context, Colors.white).copyWith(
                    fontWeight: titleFontWeight(),
                    fontSize: titleFontSize(),
                  ),
                ),
              ],
              if (subTitle.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  subTitle,
                  style: TextUtil.get20(context, Colors.white).copyWith(
                    fontWeight: subTitleFontWeight(),
                    fontSize: subTitleFontSize(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  double setHeight() {
    if (screenModel.web) return 408;
    if (screenModel.tablet) return 248;
    return 206;
  }

  double topPadding() {
    if (screenModel.web) return 170;
    if (screenModel.tablet) return 100;
    return 75;
  }

  FontWeight titleFontWeight() {
    if (screenModel.web) return FontWeight.bold;
    if (screenModel.tablet) return FontWeight.w600;
    return FontWeight.w500;
  }

  double titleFontSize() {
    if (screenModel.web) return 32;
    if (screenModel.tablet) return 24;
    return 20;
  }

  FontWeight subTitleFontWeight() {
    if (screenModel.web) return FontWeight.w600;
    if (screenModel.tablet) return FontWeight.w500;
    return FontWeight.w400;
  }

  double subTitleFontSize() {
    if (screenModel.web) return 18;
    if (screenModel.tablet) return 15;
    return 13;
  }
}
