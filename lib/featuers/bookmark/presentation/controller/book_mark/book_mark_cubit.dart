import 'package:app_new/featuers/bookmark/presentation/controller/book_mark/book_mark_states.dart';
import 'package:app_new/featuers/home_page/data/models/new_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookMarkCubit extends Cubit<BookMarkState>{
  BookMarkCubit() : super(InitialBookMarkState());

  List<NewModel> bookMarks = [];

  changeBookMark(NewModel newModel){
    newModel.bookMark = !newModel.bookMark;
    if(newModel.bookMark){
      addToBookMark(newModel: newModel);
    }else{
      removeFromBookMark(newModel: newModel);
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