import 'package:app_new/core/utilies/app_texts.dart';
import 'package:app_new/featuers/home_page/data/models/catigory_model.dart';
import 'package:flutter/material.dart';

import 'container_catigories_widget.dart';

class ListViewCatigoriesWidget extends StatelessWidget {
   ListViewCatigoriesWidget({super.key});
  List<CateoryModel> categories = [
    CateoryModel(name: AppTexts.sports),
    CateoryModel(name: AppTexts.entertainment),
    CateoryModel(name: AppTexts.health),
    CateoryModel(name: AppTexts.technology),
    CateoryModel(name: AppTexts.science),
    CateoryModel(name: AppTexts.general),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 20,),
        scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ContainerCatigoriesWidget(
              index: index,
              categoryModel: categories[index],
            );
          },
      ),
    );
  }
}
