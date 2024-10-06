import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_images.dart';
import '../../../../../core/utilies/app_texts.dart';

class BottomNavigationBarWidget extends StatelessWidget {
   BottomNavigationBarWidget({super.key, required this.currentIndex, this.onTap});
   int currentIndex;
   final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.greyOriginal,
      selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400
      ),
      unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400
      ),
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 0 ? AppImages.homeActiveIcon
                  :AppImages.noActiveHomeIcon,
            ),
            label:AppTexts.home
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.topicsActiveIcon),
            label:AppTexts.topics
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.authorActiveIcon),
            label:AppTexts.author
        ),
        const BottomNavigationBarItem(
            icon: Icon(
                Icons.bookmark
            ),
            label:AppTexts.bookMark
        ),
      ],
    );
  }
}
