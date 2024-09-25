import 'package:app_new/core/utilies/app_colors.dart';
import 'package:app_new/core/utilies/app_texts.dart';
import 'package:app_new/featuers/home_page/presentation/controller/categories/category_cubit.dart';
import 'package:app_new/featuers/home_page/presentation/controller/get_top_headline/get_top_headline_cubit.dart';
import 'package:app_new/featuers/home_page/presentation/controller/get_top_headline/get_top_headline_state.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/widgets_in_home_widget/list_view_catigories_widget.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/widgets_in_home_widget/list_view_for_news_widget.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/widgets_in_home_widget/search_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidgetScreen extends StatefulWidget {
  const HomeWidgetScreen({super.key});

  @override
  State<HomeWidgetScreen> createState() => _HomeWidgetScreenState();
}

class _HomeWidgetScreenState extends State<HomeWidgetScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<TopHeadLineCubit>(context).TopHeaLineFunc(
      category: AppTexts.sports
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => CategoryCubit(),
  child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: RefreshIndicator(
        color: AppColors.blue,
        onRefresh: ()async{
          BlocProvider.of<TopHeadLineCubit>(context).TopHeaLineFunc(
            category: AppTexts.sports
          );
        },
        child: Column(
          children: [
            SizedBox(height: 24,),
            SearchContainer(),
            SizedBox(height: 20,),
            ListViewCatigoriesWidget(),
            SizedBox(height: 30,),
            BlocConsumer<TopHeadLineCubit,GetTopHeadlineState>(
              listener: (context, state) {
                if(state is GetTopHeadlineFailureState){
                }
              },
              builder: (context, state) {
                return Expanded(
                  child: state is GetTopHeadlineLoadingState ?
                  Center(child: CircularProgressIndicator(color: AppColors.blue,),)
                      :state is GetTopHeadlineFailureState ?
                  Column(
                    children: [
                      Text(state.errorMessage),
                      SizedBox(height: 20,),
                      GestureDetector(
                        child: Container(
                          child: Text("Try Again"),
                        ),
                        onTap: (){
                          BlocProvider.of<TopHeadLineCubit>(context).TopHeaLineFunc(
                            category: AppTexts.sports
                          );
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ):
                  ListViewForNewsWidget(news: BlocProvider.of<TopHeadLineCubit>(context).topHeadLines),
                );
              }
              ),
          ],
        ),
      ),
    ),
);
  }
}