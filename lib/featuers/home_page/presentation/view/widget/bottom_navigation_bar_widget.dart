import 'package:app_new/featuers/bookmark/presentation/controller/book_mark/book_mark_cubit.dart';
import 'package:app_new/featuers/bookmark/presentation/controller/book_mark/book_mark_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<BookMarkCubit, BookMarkState>(
  builder: (context, state) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.greyOriginal,
      selectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700
      ),
      unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400
      ),
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              height: 25,
              width: 25,
              currentIndex == 0 ? AppImages.homeActiveIcon
                  :AppImages.noActiveHomeIcon,
            ),
            label:AppTexts.home
        ),
         BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(
                  size: 30,
                    Icons.bookmark
                ),
                CircleAvatar(
                  backgroundColor: AppColors.ramady,
                  radius: 9,
                  foregroundColor: AppColors.white,
                  child: Text(
                    textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700
                      ),
                      "${BlocProvider.of<BookMarkCubit>(context).bookMarks.length}"
                  ),
                )
              ],
            ),
            label:AppTexts.bookMark
        ),
      ],
    );
  },
);
  }
}
