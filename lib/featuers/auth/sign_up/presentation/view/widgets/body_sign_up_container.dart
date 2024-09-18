import 'dart:developer';

import 'package:app_new/featuers/auth/sign_up/presentation/controller/sign_up_cubit.dart';
import 'package:app_new/featuers/auth/sign_up/presentation/controller/sign_up_states.dart';
import 'package:app_new/featuers/fill_profile/presentation/view/fill_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utilies/app_colors.dart';
import '../../../../../../core/utilies/app_images.dart';
import '../../../../../../core/utilies/app_texts.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_form_field_password.dart';
import '../../../../../../core/widgets/custom_text_formfield_user_name.dart';

class BodySignUpContainer extends StatefulWidget {
  const BodySignUpContainer({super.key});

  @override
  State<BodySignUpContainer> createState() => _BodySignUpContainerState();
}

class _BodySignUpContainerState extends State<BodySignUpContainer> {
  bool checkBoxValue = false;


  @override


  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppImages.signUp,
                  width: 72,
                  height: 30,
                ),
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
                height: 15,
              ),
              CustomFormFieldPassword(
                  passwordController: confirmPassword,
                  text: AppTexts.confirmPassword),
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
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<RegisterCubit,SignUpStates>(
                listener: (context,state){
                  if(state is SignUpFailureState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.black,
                        content: Text(state.errorMessage,style: TextStyle(color: AppColors.blue,fontWeight: FontWeight.bold),)));
                  }else if(state is SignUpSuccessState){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                      return FillProfileScreen();
                    }));
                  }
                },
                builder: (context,state) {
                  return state is SignUpLoadingState? const Center(child: CircularProgressIndicator(
                    color: AppColors.blue,
                  )) :
                  CustomButton(
                    onTap: () {
                      BlocProvider.of<RegisterCubit>(context).register(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          context: context);
                    },
                    title: AppTexts.signUp,
                  );
                }
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
            ],
          ),
        ),
      ],
    );
  }
}
