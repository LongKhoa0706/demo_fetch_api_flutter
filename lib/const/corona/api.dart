
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../model/corona.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<List<Corona>> fetchCorona() async {
    List<Corona> arrCorona = [];
    var dio = Dio();
    String url = 'https://corona.lmao.ninja/countries?fbclid=IwAR1HnHljJjsrgiqp0VgxiNTnEpLNNV8XIwXkOVPsF_vyT-wy48IGjDl3fWE';
    var reponse = await dio.get(url);
    if (reponse.statusCode == 200) {
      var jsonData = reponse.data;
      for (var i in jsonData) {
        Corona corona = Corona(
            country: i['country'],
            cases: i['cases'],
            todayCases: i['todayCases'],
            deaths: i['deaths'],
            todayDeaths: i['todayDeaths'],
            recovered: i['recovered'],
            critical: i['critical']);
        arrCorona.add(corona);

      }


    } else {
      throw Exception("Fail");
    }
    return arrCorona;
  }
}