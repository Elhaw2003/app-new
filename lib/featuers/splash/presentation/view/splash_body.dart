import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilies/app_images.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinPerfect(
        duration: const Duration(seconds: 2),
        child: Image.asset(
          AppImages.logo,
          width: 186,
          height: 127,
        ),
      ),
    );
  }
}
