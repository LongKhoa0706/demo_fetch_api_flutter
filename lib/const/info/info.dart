
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fetchapiflutter/model/info.dart';

class API {
  static Future<Info> fetchInfo() async {
//    List<Info> arrInfo = List();
//    List<Data> arrData = List();
    String url = 'https://reqres.in/api/users?page=1';
    var dio = Dio();
    var res = await dio.get(url);
//    List abc =res.data;
//    print(res.data['data']);
//  List abc = res.data['data'];
//
//  arrData = abc.map((e) => Data.fromJson(e)).toList();
//  Ad ad = Ad.fromJson(res.data['ad']);
  Info info = Info.fromJson(res.data);
  return info;
//   arrInfo.add(Info.fromJson(res.data));
//   return arrInfo;
  }
}