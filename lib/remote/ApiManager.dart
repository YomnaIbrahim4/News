import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/ArticlesResponceBySearch/ArticlesResponseBySearch.dart';
import 'package:news_app/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:news_app/remote/constants.dart';

import '../model/SourcesResponse/SourcesResponse.dart';
class ApiManager{

  static Future<SourcesResponse?>getSources(String category)async{
    try{
      //https://newsapi.org/v2/top-headlines/sources?
      // category=business&apiKey=API_KEY&apiKey=6446d1940f674ad5a356bd3dbbcae56e
      Uri url = Uri.https(baseUrl,sourcesEndPoint,{
        "category":category,
        "apiKey":apiKey
      });
      var response = await http.get(url);
      Map<String,dynamic> json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    }catch(error){//exception
      print(error.toString());
    }
  }

  static Future<ArticlesResponse?>getArticles(String sourceId) async {
    //https://newsapi.org/v2/everything?
    // apiKey=6446d1940f674ad5a356bd3dbbcae56e&sources=wired
    try{
      Uri url = Uri.https(baseUrl,articlesEndPoint,{
        "apiKey" : apiKey,
        "sources" : sourceId

      });
      var response = await http.get(url);
      Map<String,dynamic> json = jsonDecode(response.body);
      var articlesResponse = ArticlesResponse.fromJson(json);
      return articlesResponse;
    }catch(error){
      print(error);

    }

  }

  static Future<ArticlesResponseBySearch?>getArticlesBySearch(String word) async {
   //https://newsapi.org/v2/everything?
    // q=bitcoin&apiKey=6446d1940f674ad5a356bd3dbbcae56e
    try{
      Uri url = Uri.https(baseUrl,articlesEndPoint,{
        "apiKey" : apiKey,
        "q" : word

      });
      var response = await http.get(url);
      Map<String,dynamic> json = jsonDecode(response.body);
      var articlesResponseBySearch = ArticlesResponseBySearch.fromJson(json);
      return articlesResponseBySearch;

    }catch(error){
      print(error);

    }

  }


}