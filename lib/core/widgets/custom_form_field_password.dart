import 'package:flutter/material.dart';

import '../utilies/app_colors.dart';
import '../utilies/app_fonts.dart';
import '../utilies/app_images.dart';

class CustomFormFieldPassword extends StatefulWidget {
  const CustomFormFieldPassword(
      {super.key, required this.text, required this.passwordController});
  final String text;
  final TextEditingController passwordController;
  @override
  State<CustomFormFieldPassword> createState() =>
      _CustomFormFieldPasswordState();
}

class _CustomFormFieldPasswordState extends State<CustomFormFieldPassword> {
  bool visablePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: widget.text,
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
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.passwordController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: AppColors.black,
                  ),
                  cursorColor: AppColors.black,
                  obscureText: visablePassword,
                  obscuringCharacter: "*",
                  onTapOutside: (p) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    visablePassword = !visablePassword;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: visablePassword == true
                      ? Container(
                          child: Image.asset(
                            AppImages.openEye,
                            width: 19,
                            height: 12,
                          ),
                        )
                      : Container(
                          child: Image.asset(
                            AppImages.closeEye,
                            width: 21,
                            height: 21,
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
