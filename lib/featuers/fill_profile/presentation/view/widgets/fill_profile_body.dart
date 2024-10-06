import 'dart:io';
import 'package:app_new/featuers/fill_profile/presentation/controller/select_image_cubit.dart';
import 'package:app_new/featuers/fill_profile/presentation/controller/select_image_states.dart';
import 'package:app_new/featuers/fill_profile/presentation/view/widgets/show_bottom_sheet.dart';
import 'package:app_new/featuers/home_page/presentation/view/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_formfield_user_name.dart';

class FillProfileBody extends StatelessWidget {
  const FillProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var imageCubit = BlocProvider.of<ImageCubit>(context);
    return BlocBuilder<ImageCubit, ImageStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: Text(
                      AppTexts.fillYourProfile,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: AppColors.white,
                              context: context, builder: (c) {
                            return ShowBottomSheet(imageCubit: imageCubit,);
                          });
                        },
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(80),
                              border: Border.all(color: AppColors.blue)),
                          child: imageCubit.image == null
                              ? const Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: AppColors.blue,
                          )
                              : ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.file(
                                File(imageCubit.image!.path),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      imageCubit.image == null?const CircleAvatar(
                        radius: 20,
                        foregroundColor: AppColors.white,
                        backgroundColor: AppColors.blue,
                        child: Icon(Icons.camera_alt_outlined),
                      ) :const Text("")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextFormfieldUserNameNotPassw(
                    text: AppTexts.fullName, keyboardType: TextInputType.text),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextFormfieldUserNameNotPassw(
                    text: AppTexts.emailAddress,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextFormfieldUserNameNotPassw(
                    text: AppTexts.phoneNumber,
                    keyboardType: TextInputType.phone),
                const SizedBox(
                  height: 280,
                ),
                CustomButton(
                    onTap: () {
                      if (imageCubit.image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text(
                                AppTexts.select_Photo_name)));
                      } else {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (c) {
                          return HomePageScreen(
                            photo: File(imageCubit.image!.path),
                          );
                        }));
                      }
                    },
                    title: AppTexts.next
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
