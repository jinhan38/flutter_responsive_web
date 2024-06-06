import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/menu_util.dart';

class MenuTabletAndMobile extends StatelessWidget {
  const MenuTabletAndMobile({
    required this.currentIndex,
    required this.tablet,
    super.key,
  });

  final int currentIndex;
  final bool tablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: tablet ? 60 : 54,
      color: Colors.white,
      padding: EdgeInsets.only(left: tablet ? 20 : 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              MenuUtil.changeIndex(context, currentIndex);
            },
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Image.asset(
              AssetPath.menuLogoBlack,
              width: tablet ? 180 : 120,
              height: 50,
              fit: BoxFit.fitWidth,
            ),
          ),
          InkWell(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Padding(
              padding: EdgeInsets.all(tablet ? 20 : 16),
              child: Image.asset(
                AssetPath.hamburger,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
