import 'package:fetchapiflutter/const/corona/api.dart';
import 'package:fetchapiflutter/model/corona.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Future<List<Corona>> futureCorona;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCorona = API.fetchCorona();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Country"),
              Text("Cases"),
              Text("Today Case"),
              Text("Deaths"),
              Text("Recoverd"),
              Text("Critical"),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: FutureBuilder<List<Corona>>(future: futureCorona,builder: ( context,  snapshot) {
              List<Corona> arr = snapshot.data;
              if(snapshot.hasData)  {
                 return ListView.separated(itemCount: arr.length, itemBuilder: (BuildContext context, int index)  {// luôn luôn phải có return
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(arr[index].country),
                      Text(arr[index].cases.toString()),
                      Text(arr[index].todayCases.toString()),
                      Text(arr[index].deaths.toString()),
                      Text(arr[index].recovered.toString()),
                      Text(arr[index].critical.toString()),
                    ],
                  );
                }, separatorBuilder: (BuildContext context, int index) =>Divider(thickness: 1,),);
              }else if(snapshot.hasError){
                return Text("${snapshot.error}");        
              }
              return CircularProgressIndicator();
            },
            ),
          ),
        ],
      ),
    );
  }
}
