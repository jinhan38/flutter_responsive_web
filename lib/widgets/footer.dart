import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/menu_util.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/text_util.dart';
import 'package:flutter_responsive_web/widgets/custom_text_button.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 250;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height,
      child: OverflowBox(
        maxWidth: width,
        maxHeight: height,
        child: Container(
          width: width,
          height: height,
          color: MyColor.gray10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                MenuUtil.menuList.length,
                (index) {
                  return CustomTextButton(
                    label: MenuUtil.menuList[index],
                    textStyle: TextUtil.get15(context, MyColor.gray80),
                    size: const Size(110, 36),
                    onPressed: () {
                      MenuUtil.changeIndex(context, index);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
