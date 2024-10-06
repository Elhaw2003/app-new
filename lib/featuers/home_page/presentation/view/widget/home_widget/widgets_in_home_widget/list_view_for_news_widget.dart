import 'package:flutter/material.dart';

import '../../../../../data/models/new_model.dart';
import 'item_widget.dart';

class ListViewForNewsWidget extends StatelessWidget {
  const ListViewForNewsWidget({super.key, required this.news});
  final List<NewModel> news;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: news.length,
        separatorBuilder: (context, index) => const SizedBox(height: 30,),
        itemBuilder: (context, index) {
          return ItemWidget(newModel: news[index]);
        },
    );
  }
}
