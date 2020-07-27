import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fetchapiflutter/test2/test2.dart';
import 'package:fetchapiflutter/test3.dart';
import 'package:fetchapiflutter/test4/home.dart';
import 'package:fetchapiflutter/test5/test5.dart';
import 'package:fetchapiflutter/test6/test6.dart';
import 'package:fetchapiflutter/test7/test7.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/model.dart';

Future<List<Person>> fetchPerson() async {
  List<Person> arrPerson = List<Person>();
  Dio dio = Dio();
  String url = 'https://jsonplaceholder.typicode.com/posts';
  Response response = await dio.get(url);
  if(response.statusCode == 200 ){
        var jsonData = response.data;
        for(var i in jsonData){
        Person person = Person(id: i['id'],title: i['title'],body: i['body']);
        arrPerson.add(person);
      }
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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage()
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Person>> futurePerson;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePerson = fetchPerson();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo fetch data"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: RefreshIndicator(
                onRefresh: (){

                },
                child: FutureBuilder<List<Person>>(
                  future: futurePerson,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {}
                      List<Person> arr = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
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
          ),
          RaisedButton(
            child: Text('Test2 '),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>Test2()));
            },
          ),
          RaisedButton(
            child: Text("Test 3 "),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Test3()));
            }
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Home()));
            },
            child: Text("Test 4"),
          ),
          RaisedButton(
              child: Text("Test 5 "),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Test5()));
              }
          ),
          RaisedButton(
              child: Text("Test 6 "),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Test6()));
              }
          ),
          RaisedButton(
              child: Text("Test 7 "),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Test7()));
              }
          ),
        ],
      ),
    );
  }
}

