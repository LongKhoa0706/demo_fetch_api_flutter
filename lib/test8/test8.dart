import 'package:fetchapiflutter/const/apitest.dart';
import 'package:flutter/material.dart';

class Test8 extends StatefulWidget {
  Test8({Key key}) : super(key: key);

  @override
  _Test8State createState() => _Test8State();
}

class _Test8State extends State<Test8> {


  @override
  Widget build(BuildContext context) {
    API.fetchDataApi();
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(

      ),
    );
  }
}