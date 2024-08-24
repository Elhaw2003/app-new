import 'package:app_new/featuers/fill_profile/presentation/view/widgets/fill_profile_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilies/app_colors.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: FillProfileBody(),
    );
  }
}
