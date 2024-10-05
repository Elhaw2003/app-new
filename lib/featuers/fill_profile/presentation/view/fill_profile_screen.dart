import 'package:app_new/featuers/fill_profile/presentation/controller/select_image_cubit.dart';
import 'package:app_new/featuers/fill_profile/presentation/view/widgets/fill_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilies/app_colors.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit(),
      child: const Scaffold(
        backgroundColor: AppColors.white,
        body: FillProfileBody(),
      ),
    );
  }
}
