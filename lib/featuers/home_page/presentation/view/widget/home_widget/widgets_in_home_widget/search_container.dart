import 'package:app_new/core/utilies/app_colors.dart';
import 'package:app_new/core/utilies/app_texts.dart';
import 'package:app_new/featuers/search_news/presentation/view/search_screen.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c){
          return SearchScreen();
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.blue),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(Icons.search_outlined,color: AppColors.blue,),
              Text(
                  AppTexts.search,
                style: TextStyle(
                  color: AppColors.blue.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
