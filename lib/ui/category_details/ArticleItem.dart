import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/main.dart';
import 'package:news_app/ui/article_details/ArticleDetails.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../model/ArticleModel.dart';
import '../../model/ArticlesResponse/Article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  ArticleItem({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ArticleDetails.routeName,arguments: article);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: article.urlToImage??"",
              width: double.infinity,
              height: 232.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                size:40.sp
              ),
            ),
            Text(article.source?.name??"",
                style: Theme.of(context).textTheme.displaySmall,),
            Text(article.title??"",
              style: Theme.of(context).textTheme.displayLarge,),
            Align(
              alignment: Alignment.centerRight,
                child: Text(timeago.format(DateTime.parse(article.publishedAt??"")),
                style: Theme.of(context).textTheme.displayMedium,),
            )
          ],
        ),
      ),
    );
  }
}
