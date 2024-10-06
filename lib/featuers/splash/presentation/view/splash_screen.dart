import 'package:app_new/featuers/auth/sign_up/presentation/view/sign_up_screen.dart';
import 'package:app_new/featuers/fill_profile/presentation/view/fill_profile_screen.dart';
import 'package:app_new/featuers/splash/presentation/view/splash_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/utilies/app_colors.dart';
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
          return const FillProfileScreen();
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blue,
      body: SplashBody()
    );
  }
}
