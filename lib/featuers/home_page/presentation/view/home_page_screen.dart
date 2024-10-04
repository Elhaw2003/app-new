import 'dart:io';

import 'package:app_new/core/utilies/app_colors.dart';
import 'package:app_new/core/utilies/app_images.dart';
import 'package:app_new/core/utilies/app_texts.dart';
import 'package:app_new/featuers/author/presentation/view/author_screen.dart';
import 'package:app_new/featuers/bookmark/presentation/view/bookmark_screen.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_page_appbar.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/home_widget_screen.dart';
import 'package:app_new/featuers/topics/presentation/view/topics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageScreen extends StatefulWidget {
   const HomePageScreen({super.key, required this.photo});
  final File photo;

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 0;
  List<Widget> bodysList = [const HomeWidgetScreen(),const TopicsScreen(),const AuthorScreen(),const BookmarkScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        flexibleSpace: HomePageAppbar(photo: widget.photo,),
      ),
      body: bodysList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.ramady,
        selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400
        ),
        unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400
        ),
        onTap: (index){
          setState(() {});
          currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.homeActiveIcon),
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
              icon: Icon(Icons.bookmark),
              label:AppTexts.bookMark
          ),
        ],
      ),
    );
  }
}
