import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/text_util.dart';
import 'package:flutter_responsive_web/widgets/custom_dropdown_button.dart';
import 'package:flutter_responsive_web/widgets/custom_text_form_field.dart';

class QuestionWidgets {
  static Widget contentTitle(BuildContext context, bool web, String label) {
    TextStyle textStyle = web
        ? TextUtil.get16(context, MyColor.gray40)
            .copyWith(fontWeight: FontWeight.w600)
        : TextUtil.get14(context, MyColor.gray40)
            .copyWith(fontWeight: FontWeight.w600);
    return Text(label, style: textStyle);
  }

  static Widget dropdownBox({
    required BuildContext context,
    required bool web,
    required String label,
    required List<String> labelList,
    required int selectedIndex,
    required Function(int index) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        contentTitle(context, web, label),
        const SizedBox(height: 4),
        CustomDropdownButton(
            height: web ? 56 : 48,
            labelList: labelList,
            web: web,
            selectedIndex: selectedIndex,
            onChanged: onChanged),
      ],
    );
  }

  static Widget formFieldBox({
    required BuildContext context,
    required bool web,
    required String label,
    required TextEditingController controller,
    required TextInputType textInputType,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        contentTitle(context, web, label),
        const SizedBox(height: 4),
        SizedBox(
          height: web ? 56 : 48,
          child: CustomTextFormField(
            verticalPadding: 25,
            controller: controller,
            textInputType: textInputType,
            hintText: hintText,
          ),
        ),
      ],
    );
  }

  static Widget contentBox(
      BuildContext context, bool web, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionWidgets.contentTitle(context, web, "문의 내용 *"),
        const SizedBox(height: 4),
        CustomTextFormField(
          controller: controller,
          textInputType: TextInputType.multiline,
          hintText: "문의 내용에 이런 내용이 포함되면 샐링잇이 빠르게 파악이 가능해요 :)"
              "\n - 서비스 구축/이용 목적"
              "\n - 원하는 기능/강의 종류"
              "\n - 레퍼런스 링크"
              "\n - 상세 설명",
          maxLines: 12,
          textHeight: 1.5,
        ),
      ],
    );
  }
}
