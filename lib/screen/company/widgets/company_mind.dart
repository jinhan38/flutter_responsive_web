import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/model/screen_model.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/text_util.dart';

class CompanyMind extends StatelessWidget {
  const CompanyMind({required this.screenModel, super.key});

  final ScreenModel screenModel;

  @override
  Widget build(BuildContext context) {
    if (screenModel.web) return webWidget(context);
    return tabletAndMobileWidget(context);
  }

  Widget webWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 1010,
      child: OverflowBox(
        maxWidth: width,
        maxHeight: 1010,
        child: SizedBox(
          width: width,
          height: 1010,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    AssetPath.companyResponsibility,
                    width: width * 0.45,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      chip(context, "책임감"),
                      const SizedBox(height: 12),
                      Text(
                        "샐링잇은 고객의 신뢰와 기대에"
                        "\n부응하기 위해 책임감을 가지고 노력합니다.",
                        style: TextUtil.get16(context, Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      chip(context, "지속가능성"),
                      const SizedBox(height: 12),
                      Text(
                        "샐링잇은 서비스의 지속가능성을 고려하여"
                        "\n최상의 결과물을 창출합니다.",
                        style: TextUtil.get16(context, Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                  Image.asset(
                    AssetPath.companySustainability,
                    width: width * 0.45,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tabletAndMobileWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AssetPath.companyResponsibility,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: screenModel.tablet ? 34 : 24),
        chip(context, "책임감"),
        SizedBox(height: screenModel.tablet ? 12 : 8),
        Text(
          "샐링잇은 고객의 신뢰와 기대에"
          "\n부응하기 위해 책임감을 가지고 노력합니다.",
          style: TextUtil.get15(context, Colors.black),
        ),
        const SizedBox(height: 80),
        Image.asset(
          AssetPath.companySustainability,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: screenModel.tablet ? 34 : 24),
        chip(context, "지속가능성"),
        SizedBox(height: screenModel.tablet ? 12 : 8),
        Text(
          "샐링잇은 서비스의 지속가능성을 고려하여"
          "\n최상의 결과물을 창출합니다.",
          style: TextUtil.get15(context, Colors.black),
        ),
      ],
    );
  }

  Widget chip(BuildContext context, String text) {
    return Container(
      height: 34,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColor.blue20,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextUtil.get14(context, Colors.black),
      ),
    );
  }
}
