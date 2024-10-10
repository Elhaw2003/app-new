import 'package:app_new/featuers/home_page/data/models/new_model.dart';
import 'package:app_new/featuers/home_page/data/repos/home_page_repo.dart';
import 'package:app_new/featuers/home_page/presentation/controller/get_top_headline/get_top_headline_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/utilies/hive.dart';

class TopHeadLineCubit extends Cubit<GetTopHeadlineState> {
  TopHeadLineCubit({required this.homePageRepo}) : super(GetTopHeadlineInitialState());
  var newsBox =  Hive.box<NewModel>(MyHive.newsBox);
  final HomePageRepo homePageRepo;

  List<NewModel> topHeadLines=[];
   addTopHeadLinesToBox(){
     topHeadLines = newsBox.values.toList();
   }
  Map<int,List<NewModel>> mapForNews ={};
  Future <void> TopHeaLineFunc(
      {
        required String category,
        required int index,
        required List<NewModel> bookMarksList,
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


              topHeadLines = topHeadLines.map((newsItem){

                if(bookMarksList.any((bookMark)=> bookMark == newsItem)){
                  newsItem.bookMark = true;
                }
                return newsItem;
              }).toList();

              mapForNews.addAll({

                index:topHeadLines

              });


              emit(GetTopHeadlineSuccessState());
            });

  }

}