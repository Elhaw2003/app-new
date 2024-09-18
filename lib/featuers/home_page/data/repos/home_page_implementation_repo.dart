import 'dart:convert';

import 'package:app_new/core/errors/failure.dart';
import 'package:app_new/core/utilies/end_points.dart';
import 'package:app_new/featuers/home_page/data/models/new_model.dart';
import 'package:app_new/featuers/home_page/data/repos/home_page_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class HomePageImplementationRepo implements HomePageRepo {
  @override
  Future<Either<Failure, List<NewModel>>> getTopHeadLines(
      {
        required String category
      }
      ) async {

    List<NewModel> news = [];
    try {
      var response = await http.get(Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.topHeadLinesEndPoint}?category=$category&apiKey=${EndPoints.apiKey}"));

      if(response.statusCode == 200) {
        for (var article in jsonDecode(response.body)["articles"]) {
          NewModel newModel = NewModel(
              title: article["title"],
              author: article["title"],
              desc: article["description"],
              content: article["content"],
              urlToImage: article["urlToImage"],
              url: article["url"],
              publishedAt: article["publishedAt"],
              sourceModel: SourceModel(id: article["source"]["id"], name:  article["source"]["name"]));
          news.add(newModel);
        }
        return right(news);
      }else{

        return left( ApiFailure(message: jsonDecode(response.body)["message"]));

      }
    } catch (e) {

      return left(
        ApiFailure(message: "erro"));
    }
  }

  @override
  Future<Either<Failure, List<NewModel>>> searchNewsFunction({required String q}) async{
    // TODO: implement searchNews
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=7f9e33aa93ff41328ba6eaa1696ae2c0
    List<NewModel> news = [];
    try {
      var response = await http.get(Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.searchEndPoint}?q=$q&apiKey=${EndPoints.apiKey}"));

      if(response.statusCode == 200) {
        for (var article in jsonDecode(response.body)["articles"]) {
          NewModel newModel = NewModel(
              title: article["title"],
              author: article["title"],
              desc: article["description"],
              content: article["content"],
              urlToImage: article["urlToImage"],
              url: article["url"],
              publishedAt: article["publishedAt"],
              sourceModel: SourceModel(id: article["source"]["id"], name:  article["source"]["name"]));
          news.add(newModel);
        }
        return right(news);
      }else{

        return left( ApiFailure(message: jsonDecode(response.body)["message"]));

      }
    } catch (e) {

      return left(
          ApiFailure(message: "Ops Error"));
    }
  }
}