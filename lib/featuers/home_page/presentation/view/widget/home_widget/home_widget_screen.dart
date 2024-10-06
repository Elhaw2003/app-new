import 'package:app_new/core/utilies/app_colors.dart';
import 'package:app_new/core/utilies/app_texts.dart';
import 'package:app_new/featuers/home_page/data/models/new_model.dart';
import 'package:app_new/featuers/home_page/presentation/controller/categories/category_cubit.dart';
import 'package:app_new/featuers/home_page/presentation/controller/get_top_headline/get_top_headline_cubit.dart';
import 'package:app_new/featuers/home_page/presentation/controller/get_top_headline/get_top_headline_state.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/widgets_in_home_widget/list_view_catigories_widget.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/widgets_in_home_widget/list_view_for_news_widget.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/widgets_in_home_widget/search_container.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/item_widget_for_failure.dart';
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
      category: AppTexts.sports,
      index: 0,
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
            category: AppTexts.sports,
            index: 0,
          );
        },
        child: Column(
          children: [
            const SizedBox(height: 24,),
            const SearchContainer(),
            const SizedBox(height: 20,),
            ListViewCatigoriesWidget(),
            const SizedBox(height: 30,),
            BlocConsumer<TopHeadLineCubit,GetTopHeadlineState>(
              listener: (context, state) {
                if(state is GetTopHeadlineFailureState){
                }
              },
              builder: (context, state) {

                int key = BlocProvider.of<CategoryCubit>(context).index;

                List<NewModel> ? news= BlocProvider.of<TopHeadLineCubit>(context).mapForNews[key];

                return Expanded(
                  child: (state is GetTopHeadlineLoadingState && news ==null) ||
                         state is GetTopHeadlineLoadingState && news!.isEmpty
                      ?
                  const Center(child: CircularProgressIndicator(color: AppColors.blue,),)
                      :state is GetTopHeadlineFailureState ?
                  ItemWidgetForFailure(state: state.errorMessage):
                  ListViewForNewsWidget(news: news!),
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