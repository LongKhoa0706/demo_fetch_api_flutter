
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetchapiflutter/const/news/api_new.dart';
import 'package:fetchapiflutter/test4/artical_model.dart';
import 'package:flutter/material.dart';

class CategoriesNews extends StatefulWidget {
  final String title;

  const CategoriesNews({Key key, this.title}) : super(key: key);


  @override
  _CategoriesNewsState createState() => _CategoriesNewsState(title);
}

class _CategoriesNewsState extends State<CategoriesNews> {
  final String title;
  _CategoriesNewsState(this.title);
  List<Artical_model> listCategories = List<Artical_model>();
  bool isLoading = true;

  getCategoriesNews() async{
    Api_new api_new = Api_new();
    await api_new.getDataCategoriesNews(title);
     listCategories = api_new.news;
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoriesNews();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(shrinkWrap: true,itemCount: listCategories.length,itemBuilder: (_,index){
                return Column(
                  children: <Widget>[
                    CachedNetworkImage(imageUrl: listCategories[index].urlToImage,height: 180,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                    Text(listCategories[index].title),
                    Text(listCategories[index].description),
                  ],
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
