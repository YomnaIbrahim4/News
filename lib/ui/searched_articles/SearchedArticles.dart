import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/category_details/ArticlesList.dart';

import '../../model/ArticlesResponse/Article.dart';
import '../../remote/ApiManager.dart';
import '../category_details/ArticleItem.dart';

class SearchedArticles extends StatefulWidget {
  static const String routeName = "searchedArticles";

  SearchedArticles({super.key});

  @override
  State<SearchedArticles> createState() => _SearchedArticlesState();
}

class _SearchedArticlesState extends State<SearchedArticles> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";  // hold the search query.

  // Method to fetch articles based on search query or fetch all articles if no query is present
  Future<List<Article>> getArticles() async {
    if (searchQuery.isEmpty) {
      // If no search query, fetch all articles
      var response = await ApiManager.getArticlesBySearch("");  // Empty query to get all articles
      return response?.articles ?? [];
    } else {
      // If there's a search query, fetch articles based on the search query
      var response = await ApiManager.getArticlesBySearch(searchQuery);
      return response?.articles ?? [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(
              right: 5,
              left: 5,
              bottom: 5,
              top: 5,
            ),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search Article',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  fontSize: 15.sp,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    onPress(searchController.text);  // Pass the search query to onPress
                  },
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: FutureBuilder<List<Article>>(
          future: getArticles(), // Fetch articles based on searchQuery
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});  // Trigger re-fetch on error
                    },
                    child: Text("Try again"),
                  ),
                ],
              );
            }
            var articles = snapshot.data ?? [];

            return ListView.separated(
              itemBuilder: (context, index) => ArticleItem(
                article: articles[index],
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: articles.length,
            );
          },
        ),
      ),
    );
  }

  // Update the search query and trigger the API call
  onPress(String word) {
    setState(() {
      searchQuery = word;  // Update the search query
    });
  }
}
