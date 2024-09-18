import 'package:app_new/featuers/auth/sign_up/data/repos/register_rebo_implementation.dart';
import 'package:app_new/featuers/auth/sign_up/presentation/controller/sign_up_cubit.dart';
import 'package:app_new/featuers/auth/sign_up/presentation/view/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
          registerRepo: RegisterFirebaseImplementation(),
      ),
      child: const Scaffold(
        backgroundColor: AppColors.blue,
        body: SignUpBody(),
      ),
    );
  }
}
