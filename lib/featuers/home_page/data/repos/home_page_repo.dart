import 'package:app_new/core/errors/failure.dart';
import 'package:app_new/featuers/home_page/data/models/new_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomePageRepo{

 Future<Either<Failure,List<NewModel>>> getTopHeadLines(
 {
  required String category
}
     );
 Future<Either<Failure,List<NewModel>>> searchNewsFunction(
     {
      required String q
     }
     );


}