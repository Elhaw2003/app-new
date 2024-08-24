import 'package:app_new/featuers/auth/login/presentation/view/widgets/login_body.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilies/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blue,
      body: LoginBody(),
    );
  }
}
