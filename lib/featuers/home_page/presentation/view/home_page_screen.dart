import 'dart:io';
import 'package:app_new/featuers/bookmark/presentation/view/bookmark_screen.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/bottom_navigation_bar_widget.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_page_appbar.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/home_widget_screen.dart';
import 'package:flutter/material.dart';
class HomePageScreen extends StatefulWidget {
   const HomePageScreen({super.key, required this.photo});
  final File photo;

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 0;
  List<Widget> bodysList = [const HomeWidgetScreen(),const BookmarkScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        flexibleSpace: HomePageAppbar(photo: widget.photo,),
      ),
      body: bodysList[currentIndex],
      bottomNavigationBar: BottomNavigationBarWidget(
          onTap: (index){
            setState(() {});
            currentIndex = index;
          },
          currentIndex: currentIndex
      )
    );
  }
}
