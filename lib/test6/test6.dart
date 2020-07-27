import 'package:fetchapiflutter/const/user/user.dart';
import 'package:fetchapiflutter/model/user.dart';
import 'package:flutter/material.dart';

class Test6 extends StatefulWidget {
  Test6({Key key}) : super(key: key);

  @override
  _Test6State createState() => _Test6State();
}

class _Test6State extends State<Test6> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    API.fetchUser();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: FutureBuilder<List<User>>(
          future: API.fetchUser(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData) {

              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  User user = snapshot.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(user.id.toString(),style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(user.username,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(
                                height: 5,
                              ),
                              Text(user.email,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),),
                              SizedBox(
                                height: 5,
                              ),
                              Text(user.address.city),
                              SizedBox(
                                height: 5,
                              ),
                              Text(user.address.street),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(user.address.geo.lat),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(user.address.geo.lng),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(user.company.catchPhrase)
                            ],
                          ),

                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}