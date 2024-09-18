import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_images.dart';

class HomePageAppbar extends StatelessWidget {
  const HomePageAppbar({super.key, required this.photo});
  final File photo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: null,
      toolbarHeight: 120,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          radius: 40,
          backgroundImage: Image.file(
            photo,
            fit: BoxFit.cover,
          ).image,
        ),
      ),
      title: Image.asset(
        AppImages.logo,
        color: AppColors.blue,
        width: 144,
        height: 63,
      ),
      centerTitle: true,
    );
  }
}
