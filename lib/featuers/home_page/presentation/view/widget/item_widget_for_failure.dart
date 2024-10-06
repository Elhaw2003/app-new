import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_texts.dart';
import '../../controller/get_top_headline/get_top_headline_cubit.dart';

class ItemWidgetForFailure extends StatelessWidget {
  const ItemWidgetForFailure({super.key, required this.state});
  final String state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(state),
        SizedBox(height: 20,),
        GestureDetector(
          child: Container(
            child: Text(AppTexts.tryAgain),
          ),
          onTap: (){
            BlocProvider.of<TopHeadLineCubit>(context).TopHeaLineFunc(
                category: AppTexts.sports,
                index: 0,
            );
          },
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
