import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/text_util.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    required this.height,
    required this.labelList,
    required this.web,
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  });

  final double height;
  final List<String> labelList;
  final bool web;
  final int selectedIndex;
  final Function(int index) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.5))
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: DropdownButton<int>(
              autofocus: false,
              elevation: 12,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemHeight: height,
              dropdownColor: Colors.white,
              underline: const SizedBox(),
              icon: const Visibility(
                visible: false,
                child: Icon(Icons.add),
              ),
              style: web
                  ? TextUtil.get16(context, MyColor.gray90)
                  : TextUtil.get15(context, MyColor.gray90),
              value: selectedIndex,
              items: List.generate(
                labelList.length,
                (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text(
                      labelList[index],
                    ),
                  );
                },
              ),
              onChanged: (value) {
                onChanged(value!);
              },
            ),
          ),
          const Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 24,
              color: MyColor.gray40,
            ),
          )
        ],
      ),
    );
  }
}
