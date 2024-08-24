import 'package:app_new/featuers/auth/sign_up/presentation/view/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilies/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blue,
      body: SignUpBody(),
    );
  }
}
