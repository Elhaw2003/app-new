import 'package:flutter/material.dart';

import '../../../../../../core/utilies/app_colors.dart';
import 'body_container_widget.dart';
import 'logo_widget.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.12,
        ),
        const LogoWidget(),
        const SizedBox(
          height: 43,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                )),
            child: const BodyContainerWidget(),
          ),
        )
      ],
    );
  }
}
