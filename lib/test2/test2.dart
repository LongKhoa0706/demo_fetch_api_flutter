import 'dart:convert';
import 'package:fetchapiflutter/const/corona/api.dart';
import 'package:fetchapiflutter/test2/detail.dart';
import 'package:intl/intl.dart';
import 'package:fetchapiflutter/model/corona.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {



static  Future<List<Corona>> futureCorona;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCorona = API.fetchCorona();

  }

  @override
  Widget build(BuildContext context) {

    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String currenTime = '';
    String formattedTime = DateFormat('kk:mm:a').format(now);
    String formattedDate = formatter.format(now);

    List<Color> listColor = [
      Colors.red,
      Colors.orange,
      Colors.yellow[600],
    ];
    List<String> listTitle = [
      "Cases",
      "Today Cases ",
      "Recovered"
    ];


    setState(() {
      currenTime = formattedTime;
    });

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(

                image: DecorationImage(
                    image: AssetImage('assets/virus.jpg'), fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 170),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "VietNam",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 3,
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 100,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffedd8),
                                ),
                                child: Text(formattedDate),
                              ),
                              Container(
                                width: 100,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffedd8),
                                ),
                                child: Center(child: Text(currenTime)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RefreshIndicator(
                            onRefresh: () async{
                              print("a");
                            },
                            child: FutureBuilder<List<Corona>>(future: futureCorona,builder: (BuildContext context,  snapshot)  {
                              List<Corona> arr = snapshot.data;
                              List arr1 = [];
                              for(var i in arr){
                                if(i.country == "Vietnam"){
                                  arr1.add(i.cases.toString());
                                  arr1.add(i.todayCases.toString());
                                  arr1.add(i.recovered.toString());
                                }
                              }

                              if(snapshot.hasData){
                                return SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: arr1.length,
                                    itemBuilder: (_, index) {

                                      return Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Container(
                                          width: 100,
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: listColor[index],
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment:MainAxisAlignment.center ,
                                            children: <Widget>[
                                              Text(listTitle[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(arr1[index],style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),)

                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                              return CircularProgressIndicator();
                            },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "The World",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 3,
                    child: Container(
                      width: double.infinity,
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>Detail()));
                            },
                            child: Align(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffedd8),
                                ),
                                child: Text("Detail"),
                              ),
                              alignment: Alignment.topRight,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FutureBuilder<List<Corona>>(future: futureCorona,builder: (BuildContext context,  snapshot) {
                            List<Corona> arr = snapshot.data;
                            List<int> array = [];
                            List<int> array2 = [];
                            List<int> array3 = [];
                            for(var i in arr){
                              array.add(i.cases);
                              array2.add(i.deaths);
                              array3.add(i.recovered);
                            }
                            final sum = array.reduce((acc , e ) => acc + e);
                            final sum2 = array2.reduce((acc , e ) => acc + e );
                            final sum3 = array3.reduce((acc , e ) => acc + e );

                            if(snapshot.hasData){
                              return SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Container(
                                        width: 100,
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: listColor[index],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment:MainAxisAlignment.center ,
                                          children: <Widget>[
                                            Text(listTitle[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(index == 0 ? sum.toString() : index == 1 ? sum2.toString() : index == 2 ? sum3.toString() : "CC",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),)

                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                            return CircularProgressIndicator();
                          },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],

      )),
    );
  }

}

