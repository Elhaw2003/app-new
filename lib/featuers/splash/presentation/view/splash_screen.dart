import 'package:animate_do/animate_do.dart';
import 'package:app_new/featuers/auth/sign_up/presentation/view/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilies/app_colors.dart';
import '../../../../core/utilies/app_images.dart';
import '../../../auth/login/presentation/view/login_screen.dart';
import '../../../fill_profile/presentation/view/fill_profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
          return const SignUpScreen();
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Center(
        child: SpinPerfect(
          duration: const Duration(seconds: 2),
          child: Image.asset(
            AppImages.logo,
            width: 186,
            height: 127,
          ),
        ),
      ),
    );
  }
}
