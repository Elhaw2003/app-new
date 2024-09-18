import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/widget_in_home_widget/item_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/new_model.dart';

class ListViewForNewsWidget extends StatelessWidget {
  const ListViewForNewsWidget({super.key, required this.news});
  final List<NewModel> news;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: news.length,
        separatorBuilder: (context, index) => SizedBox(height: 30,),
        itemBuilder: (context, index) {
          return ItemWidget(newModel: news[index]);
        },
    );
  }
}
