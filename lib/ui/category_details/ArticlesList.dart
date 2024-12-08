import 'package:flutter/material.dart';
import 'package:news_app/model/ArticleModel.dart';
import 'package:news_app/remote/ApiManager.dart';
import 'package:news_app/ui/category_details/ArticleItem.dart';

import '../../model/ArticlesResponse/Article.dart';

class ArticlesList extends StatefulWidget {
  String sourceId;
  ArticlesList({required this.sourceId});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(widget.sourceId),//my request
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){ // not from server
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton( // refresh to make new request
                    onPressed: (){
                      setState(() {

                      });
                    },
                    child: Text("Try again")
                )
              ],
            );
          }
          var response = snapshot.data;
          if(response?.status == "error"){ // from server
            return Column(
              children: [
                Text(response?.message??""),
                ElevatedButton( // refresh to make new request
                    onPressed: (){
                      setState(() {

                      });
                    },
                    child: Text("Try again")
                )
              ],
            );
          }

          List<Article> articles = response?.articles??[];
          return ListView.separated(
              itemBuilder: (context, index) => ArticleItem(
                  article: articles[index]
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: articles.length);
        },
    );
  }
}
