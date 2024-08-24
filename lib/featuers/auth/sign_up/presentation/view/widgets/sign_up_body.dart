import 'package:flutter/material.dart';

import '../../../../../../core/utilies/app_colors.dart';
import '../../../../login/presentation/view/widgets/logo_widget.dart';
import 'body_sign_up_container.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.12,
        ),
        const LogoWidget(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                )),
            child: const BodySignUpContainer(),
          ),
        )
      ],
    );
  }
}
