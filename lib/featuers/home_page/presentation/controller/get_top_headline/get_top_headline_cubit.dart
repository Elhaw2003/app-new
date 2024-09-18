import 'package:app_new/featuers/home_page/data/models/new_model.dart';
import 'package:app_new/featuers/home_page/data/repos/home_page_repo.dart';
import 'package:app_new/featuers/home_page/presentation/controller/get_top_headline/get_top_headline_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopHeadLineCubit extends Cubit<GetTopHeadlineState> {
  TopHeadLineCubit({required this.homePageRepo}) : super(GetTopHeadlineInitialState());

  final HomePageRepo homePageRepo;

  List<NewModel> topHeadLines=[];

  Future <void> TopHeaLineFunc(
      {
        required String category
      }
      )async{
    emit(GetTopHeadlineLoadingState());
    var result = await homePageRepo.getTopHeadLines(
      category: category
    );

    return result.fold(
            (left){
              emit(GetTopHeadlineFailureState(errorMessage: left.message));
            },
            (right){
              topHeadLines = right;
              emit(GetTopHeadlineSuccessState());
            });

  }

}