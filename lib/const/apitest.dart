import 'package:dio/dio.dart';
import 'package:fetchapiflutter/model/apitest.dart';

class API{

  static Future<List<Apitest>> fetchDataApi() async{
    List<Apitest>listApiTest = List();
    String url = 'https://gorest.co.in/public-api/users?_format=json&access-token=kQJpz3SF1CeYnt9p8XNXw8F64peqvZfmlb23';
    var dio = Dio();
    var res = await dio.get(url);
    var json = res.data['result'];
    List abc = json;
    listApiTest = abc.map((e) => Apitest.fromJson(e)).toList();
//    listApiTest.add(Apitest.fromJson(res.data['result']));
//    Apitest apitest = Apitest.fromJson(res.data['result']);
  }
}