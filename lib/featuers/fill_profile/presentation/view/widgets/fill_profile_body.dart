import 'dart:io';

import 'package:app_new/featuers/home_page/presentation/view/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_formfield_user_name.dart';

class FillProfileBody extends StatefulWidget {
  const FillProfileBody({super.key});

  @override
  State<FillProfileBody> createState() => _FillProfileBodyState();
}

class _FillProfileBodyState extends State<FillProfileBody> {
  ImagePicker picker = ImagePicker();

  XFile? image;

  getPhoto(ImageSource imageSource) async {
    image = await picker.pickImage(source: imageSource);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                      return getPhoto(ImageSource.camera);
                    },
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(color: AppColors.blue)),
                      child: image == null
                          ? const Icon(
                              Icons.add_a_photo,
                              size: 50,
                              color: AppColors.blue,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                              )),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 20,
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.blue,
                    child: Icon(Icons.camera_alt_outlined),
                  )
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
                text: AppTexts.phoneNumber, keyboardType: TextInputType.phone),
            const SizedBox(
              height: 280,
            ),
             CustomButton(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                    return HomePageScreen(
                      photo: File(image!.path),
                    );
                  }));
                },
                title: AppTexts.next
            )
          ],
        ),
      ),
    );
  }
}
