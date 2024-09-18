import 'package:app_new/core/utilies/app_colors.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/widget_in_home_widget/list_view_for_news_widget.dart';
import 'package:app_new/featuers/search_news/presentation/controller/search_cubit.dart';
import 'package:app_new/featuers/search_news/presentation/controller/search_states.dart';
import 'package:app_new/featuers/search_news/presentation/view/widget/form_field_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 30,),
              FormFieldNews(),
              SizedBox(height: 30,),
              Expanded(child:
              state is SearchLoadingState ? Center(child: CircularProgressIndicator(color: AppColors.blue,),)
                  :ListViewForNewsWidget(news: BlocProvider.of<SearchCubit>(context).searchNews)),
            ],
          );
        },
      ),
    );
  }
}
