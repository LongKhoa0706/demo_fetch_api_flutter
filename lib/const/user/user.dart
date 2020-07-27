import 'package:dio/dio.dart';
import 'package:fetchapiflutter/model/user.dart';

class API {
  static Future<List<User>> fetchUser() async {
    List<User> arrUser = List();
    String url = 'https://jsonplaceholder.typicode.com/users';
    var dio = Dio();
    var res = await dio.get(url);
    var jsonRes = res.data;
    List abc = jsonRes;
    arrUser = abc.map((e) => User.fromJson(e)).toList();
    print(arrUser.length);
    return arrUser;

  }
}