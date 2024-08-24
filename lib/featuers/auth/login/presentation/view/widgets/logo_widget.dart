import 'package:flutter/material.dart';

import '../../../../../../core/utilies/app_images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      width: 186,
      height: 127,
    );
  }
}
