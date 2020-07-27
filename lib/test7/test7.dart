import 'package:fetchapiflutter/const/info/info.dart';
import 'package:fetchapiflutter/model/info.dart';
import 'package:flutter/material.dart';

class Test7 extends StatefulWidget {
  Test7({Key key}) : super(key: key);

  @override
  _Test7State createState() => _Test7State();
}

class _Test7State extends State<Test7> {

  @override
  Widget build(BuildContext context) {
    API.fetchInfo();
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Info>(
        future: API.fetchInfo(),
        builder: (BuildContext context, AsyncSnapshot<Info> snapshot) {
          if (snapshot.hasData) {
            Info info = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(info.page.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Data data = info.data[index];
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(data.avatar),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },

                )
              ],
            );
          }
          return CircularProgressIndicator();
        },),
    );
  }
}