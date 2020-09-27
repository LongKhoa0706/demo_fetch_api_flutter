import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fetchapiflutter/model/artical.dart';
import 'package:fetchapiflutter/test4/artical_model.dart';
import 'package:http/http.dart' as http;

class Api_new_fix {
  List<Article> news = [];

   Future<void> getDataNews() async {
    var dio = Dio();
    String url = 'http://newsapi.org/v2/top-headlines?country=us&apiKey=554a1d9082b048b9a5677d56b556bc25';
    var reponse = await dio.get(url);
    var jsonData = reponse.data;
    if (jsonData['status'] == 'ok') {
      List a = jsonData['articles'];
      news = a.map((e) => Article.fromJson(e)).toList();
      print(news.length);
    }
  }

//  Future<void> getDataCategoriesNews(String categories) async {
//    var dio = Dio();
//    String url = 'http://newsapi.org/v2/top-headlines?country=us&category=$categories&apiKey=554a1d9082b048b9a5677d56b556bc25';
//    var reponse = await dio.get(url);
//    var jsonData = reponse.data;
//    if (jsonData['status'] == 'ok') {
//      jsonData['articles'].forEach((element) {
//        if (element['urlToImage'] != null && element['description'] != null) {
//          Artical_model artical_model = Artical_model(
//              title: element['title'],
//              author: element['author'],
//              description: element['description'],
//              url: element['url'],
//              urlToImage: element['urlToImage'],
//              publishedAt: element['publishedAt'],
//              content: element['content']);
//          news.add(artical_model);
//        }
//      });
//    }
//  }


}
