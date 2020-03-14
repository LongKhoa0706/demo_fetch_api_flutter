import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

Future<List<Person>> fetchPerson() async {
  List<Person> arrPerson = [];
  final reponse = await http.get('https://jsonplaceholder.typicode.com/posts');
  if (reponse.statusCode == 200) {
    // nếu servel trả ra 1 kết quả 200 OK từ repónse,
    // sau do sẽ parjson
    var jsonData = json.decode(reponse.body);
    for (var i in jsonData) {
      Person person = Person(
          userId: i['userId'], id: i['id'], title: i['title'], body: i['body']);
      arrPerson.add(person);
    }
  } else {
    // nếu servel không trả về kết quả 200 OK repónsse;
    // sau đó sẽ xuất ra lỗi
    throw Exception("Fail fetch data ");
  }
  return arrPerson;
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Person>> futurePerson;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePerson = fetchPerson();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo fetch data"),
        ),
        body: Center(
          child: FutureBuilder<List<Person>>(
            future: futurePerson,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {}
                List<Person> arr = snapshot.data;
                return ListView.builder(
                  itemCount: arr.length,
                  itemBuilder: (_, int index) {
                    return ListTile(
                      leading: Text(arr[index].id.toString()),
                      title: Text(arr[index].title),
                      subtitle: Text(arr[index].body),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
