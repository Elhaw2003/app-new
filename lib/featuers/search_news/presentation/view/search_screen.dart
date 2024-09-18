import 'package:app_new/core/utilies/app_colors.dart';
import 'package:app_new/core/utilies/app_images.dart';
import 'package:app_new/featuers/home_page/data/repos/home_page_implementation_repo.dart';
import 'package:app_new/featuers/search_news/presentation/controller/search_cubit.dart';
import 'package:app_new/featuers/search_news/presentation/view/widget/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(homePageRepo: HomePageImplementationRepo()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: null,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.blue,),
          ),
          centerTitle: true,
          toolbarHeight: 130,
          title: Image.asset(
            color: AppColors.blue,
              AppImages.logo,
            width: 130,
            height: 150,
          ),
        ),
        body: SearchBody(),
      ),
    );
  }
}
