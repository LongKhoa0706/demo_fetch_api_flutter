import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;
class Test3 extends StatefulWidget {
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  Xml2Json xml2json = Xml2Json();

  Future<bool> getData () async {
    String url = 'https://vnexpress.net/rss/tin-moi-nhat.rss';
    var reponse = await http.get(url);
    xml2json.parse(reponse.body);
    var jsonData = xml2json.toGData();
    var data = json.decode(jsonData);
    print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
