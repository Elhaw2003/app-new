import 'package:flutter/material.dart';

import '../../../../../../core/utilies/app_colors.dart';
import '../../../../../../core/utilies/app_images.dart';
import '../../../../../../core/utilies/app_texts.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_form_field_password.dart';
import '../../../../../../core/widgets/custom_text_formfield_user_name.dart';
import '../../../../sign_up/presentation/view/sign_up_screen.dart';

class BodyContainerWidget extends StatefulWidget {
  const BodyContainerWidget({super.key});

  @override
  State<BodyContainerWidget> createState() => _BodyContainerWidgetState();
}

class _BodyContainerWidgetState extends State<BodyContainerWidget> {
  bool checkBoxValue = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppImages.loginText,
                  width: 72,
                  height: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormfieldUserNameNotPassw(
                  controller: emailController,
                  text: AppTexts.username,
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              CustomFormFieldPassword(
                passwordController: passwordController,
                text: AppTexts.password,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: AppColors.white,
                    activeColor: AppColors.blue,
                    value: checkBoxValue,
                    onChanged: (b) {
                      setState(() {
                        checkBoxValue = !checkBoxValue;
                      });
                    },
                  ),
                  const Text(
                    AppTexts.rememberMe,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.ramady,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    AppTexts.forgotThePassword,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.blue.withOpacity(0.8),
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (c) {
                    return const SignUpScreen();
                  }));
                },
                title: AppTexts.login,
              ),
              const SizedBox(
                height: 17,
              ),
              const Center(
                child: Text(
                  AppTexts.orContinueWith,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.ramady,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.facebook,
                            color: AppColors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: Text(AppTexts.facebook))
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Image.asset(
                            AppImages.google,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(child: Text(AppTexts.google))
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTexts.dontHaveAnAccount,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.ramady,
                    ),
                  ),
                  Text(
                    AppTexts.signUp,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.blue,
                    ),
                  )
                ],
              ),
              // SizedBox(height: 10,)
            ],
          ),
        ),
      ],
    );
  }
}
