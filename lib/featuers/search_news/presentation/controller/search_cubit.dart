import 'package:app_new/featuers/home_page/data/models/new_model.dart';
import 'package:app_new/featuers/home_page/data/repos/home_page_repo.dart';
import 'package:app_new/featuers/home_page/presentation/controller/get_top_headline/get_top_headline_state.dart';
import 'package:app_new/featuers/search_news/presentation/controller/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.homePageRepo}) : super(SearchInitialState());

  final HomePageRepo homePageRepo;

  List<NewModel> searchNews=[];

  Future <void> getSearchFunc(
      {
        required String q
      }
      )async{
    emit(SearchLoadingState());
    var result = await homePageRepo.searchNewsFunction(
        q: q
    );

    return result.fold(
            (left){
          emit(SearchFailureState(errorMessage: left.message));
        },
            (right){
          searchNews = right;
          emit(SearchSuccessState());
        });

  }

}