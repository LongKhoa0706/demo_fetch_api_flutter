import 'package:dio/dio.dart';
import 'package:fetchapiflutter/const/todo.dart';

class API {
  static Future<List<Todo>> fetchTodo() async {
    List<Todo> arrTodo = [];
    var dio = Dio();
    String url = 'https://jsonplaceholder.typicode.com/todos';
    var reponse = await dio.get(url);
    if (reponse.statusCode == 200) {
      var jsonData = reponse.data;
      for (var i in jsonData) {
        arrTodo.add(Todo.fromJson(i));
      }
    } else {
      throw Exception("Fail");
    }
    print(arrTodo.length);
    return arrTodo;
  }
}