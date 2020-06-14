import 'package:fetchapiflutter/const/api_todo.dart';
import 'package:fetchapiflutter/const/todo.dart';
import 'package:flutter/material.dart';

class Test5 extends StatefulWidget {
  Test5({Key key}) : super(key: key);

  @override
  _Test5State createState() => _Test5State();
}

class _Test5State extends State<Test5> {
  Future<List<Todo>> abc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    abc = API.fetchTodo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: FutureBuilder(
          future: abc,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            List<Todo> arr = snapshot.data;
            return ListView.builder(
              itemCount: arr.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                Todo todo = arr[index];
                return ListTile(
                  leading: Text(todo.id.toString()),
                  title: Text(todo.title),
                  subtitle: Text(todo.userId.toString()),
                );
              },

            );
          },),
      ),
    );
  }
}