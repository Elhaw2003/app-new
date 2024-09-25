import 'package:app_new/featuers/home_page/presentation/controller/categories/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryStates>{
  CategoryCubit() : super(InitialCategoryState());

  int index = 0;
  changeIndex(int index){
    this.index = index;
    emit(ChangeColorCategoryState());
  }

}