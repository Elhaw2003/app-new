import 'package:app_new/core/utilies/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../controller/search_cubit.dart';

class FormFieldNews extends StatelessWidget {
  const FormFieldNews({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (q){
        BlocProvider.of<SearchCubit>(context).getSearchFunc(q: q.trim());
      },
      onTapOutside: (p) {
        FocusManager.instance.primaryFocus!.unfocus();
      } ,
      cursorColor: AppColors.blue,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search_outlined,color: AppColors.blue,),
          hintText:  AppTexts.search,
          hintStyle: TextStyle(
              color: AppColors.blue.withOpacity(0.8),
              fontSize: 14,
              fontWeight: FontWeight.w400
          ),
          focusColor: AppColors.blue,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.ramady)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.blue)
          )
      ),
    );
  }
}
