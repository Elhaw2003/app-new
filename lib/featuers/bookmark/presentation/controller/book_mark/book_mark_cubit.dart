import 'package:app_new/featuers/bookmark/presentation/controller/book_mark/book_mark_states.dart';
import 'package:app_new/featuers/home_page/data/models/new_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/utilies/hive.dart';

class BookMarkCubit extends Cubit<BookMarkState>{
  BookMarkCubit() : super(InitialBookMarkState());

  var newsBox =  Hive.box<NewModel>(MyHive.newsBox);

  List<NewModel> bookMarks = [];
  addBookMarksToBox(){
    bookMarks = newsBox.values.toList();
  }
  changeBookMark(NewModel newModel){
    newModel.bookMark = !newModel.bookMark;
    if(newModel.bookMark){
      addToBookMark(newModel: newModel);
      newsBox.add(newModel);
    }else{
      removeFromBookMark(newModel: newModel);
      newsBox.delete(newModel);
    }
    emit(ChangeBookMarkState());
  }
  addToBookMark(
  {
    required NewModel newModel,
}
      )
  {
    bookMarks.add(newModel);
  }
  removeFromBookMark(
      {
        required NewModel newModel,
      }
      )
  {
    bookMarks.remove(newModel);
  }
}