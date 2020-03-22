
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetchapiflutter/test4/artical_model.dart';
import 'package:fetchapiflutter/test4/category_model.dart';
import 'package:fetchapiflutter/test4/category_news.dart';
import 'package:fetchapiflutter/test4/data.dart';
import 'package:fetchapiflutter/const/news/api_new.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Artical_model > listArtical = List<Artical_model>();
  List<CategoryModel> listCategories = List<CategoryModel>();
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listCategories = getCategories();
    getNews();
  }

  getNews() async {
    Api_new api_new = Api_new();
    await api_new.getDataNews();
    listArtical = api_new.news;
    setState(() {
      isLoading = false;
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter",style: TextStyle(color: Colors.black),),
            Text("New",style: TextStyle(color: Colors.blue),),
          ],
        ),
        centerTitle: true,
      ),
      body: isLoading  ? Container(
        child: Center(child: CircularProgressIndicator()),
      ) : Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
              child: ListView.builder(itemCount: listCategories.length,scrollDirection: Axis.horizontal,shrinkWrap: true,itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>CategoriesNews(title: listCategories[index].title,)));
                  },
                  child: Category(
                      title: listCategories[index].title,
                      imgURL: listCategories[index].imageURL,

                  ),
                );
              },),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(shrinkWrap: true,itemCount: listArtical.length,itemBuilder: (_,index){
                 return Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: BlogTitle(
                     title: listArtical[index].title,
                     imgURL: listArtical[index].urlToImage,
                     desc: listArtical[index].description,
                   ),
                 );
                },),
              ),
            )
       
          ],
        ),
      ),
    );
  }
}
class Category extends StatelessWidget {
  final String imgURL,title;

  const Category({Key key, this.imgURL, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Stack(
        children: <Widget>[
          ClipRRect(borderRadius: BorderRadius.circular(10),
              child: Image.network(imgURL.isEmpty ? CircularProgressIndicator() : imgURL, width: 120, height: 120, fit: BoxFit.cover)),
          Container(
            alignment: Alignment.center,
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26
            ),
            child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
class BlogTitle extends StatelessWidget {
  final String imgURL,title,desc;

  const BlogTitle({Key key, this.imgURL, this.title, this.desc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          CachedNetworkImage(imageUrl: imgURL,
            width: MediaQuery.of(context).size.width,
            height: 180,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context,url,err)=>Icon(Icons.error),

          ),
          SizedBox(
            height: 10,
          ),
        Text(title??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        SizedBox(
          height: 10,
        ),
        Text(desc ?? "",style: TextStyle(color: Colors.grey),)
      ],
    );
  }
}


