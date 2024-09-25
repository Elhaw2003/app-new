import 'package:app_new/core/utilies/app_colors.dart';
import 'package:app_new/featuers/home_page/presentation/controller/categories/category_cubit.dart';
import 'package:app_new/featuers/home_page/presentation/controller/categories/category_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/catigory_model.dart';
import '../../../../controller/get_top_headline/get_top_headline_cubit.dart';

class ContainerCatigoriesWidget extends StatelessWidget {
  const ContainerCatigoriesWidget({super.key, required this.categoryModel, required this.index});
  final CateoryModel categoryModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
  builder: (context, state) {
    return GestureDetector(
      onTap: (){
        BlocProvider.of<TopHeadLineCubit>(context).TopHeaLineFunc(
            category: categoryModel.name
        );
        BlocProvider.of<CategoryCubit>(context).changeIndex(index);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blue,width: 0.5),
          borderRadius: BorderRadius.circular(13),
          color: BlocProvider.of<CategoryCubit>(context).index == index ?
          AppColors.blue
              : AppColors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            categoryModel.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: BlocProvider.of<CategoryCubit>(context).index == index ?
                  FontWeight.w700
                  :FontWeight.w300
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
