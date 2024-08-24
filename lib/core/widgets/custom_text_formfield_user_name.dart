import 'package:flutter/material.dart';

import '../utilies/app_colors.dart';
import '../utilies/app_fonts.dart';

class CustomTextFormfieldUserNameNotPassw extends StatelessWidget {
  const CustomTextFormfieldUserNameNotPassw(
      {super.key,
      required this.text,
      required this.keyboardType,
      this.controller});
  final String text;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: text,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.ramady,
                  fontFamily: AppFonts.poppins),
              children: const [
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.red,
                      fontFamily: AppFonts.poppins),
                )
              ]),
        ), // (عشان نحط اكتر من text جنب بعض )<<
        const SizedBox(
          height: 4,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.ramady)),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(color: AppColors.black),
            cursorColor: AppColors.black,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            onTapOutside: (p) {
              FocusManager.instance.primaryFocus!.unfocus();
            },
          ),
        ),
      ],
    );
  }
}
