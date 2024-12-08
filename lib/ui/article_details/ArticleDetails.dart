import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/ArticlesResponse/Article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatefulWidget {
  static const String routeName = "ArticleDetails";
  ArticleDetails({super.key});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    Article? article = ModalRoute.of(context)!.settings.arguments as Article?;
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
          title: Text(article?.title ?? ""),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: article?.urlToImage ?? "",
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 40.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Text(article?.source?.name ?? "", style: Theme.of(context).textTheme.displaySmall),
              SizedBox(height: 5.h),
              Text(article?.title ?? "", style: Theme.of(context).textTheme.displayLarge),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  timeago.format(DateTime.parse(article?.publishedAt ?? "")),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(height: 30.h),
              Text("*Author*",style: Theme.of(context).textTheme.labelMedium,),
              Text(
                article?.author ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20.h),
              Text("*Description*",style: Theme.of(context).textTheme.labelMedium,),
              Text(
                article?.description ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20.h),
              Text("*Content*",style: Theme.of(context).textTheme.labelMedium,),
              Text(
                article?.content ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    // Check if the article has a valid URL and launch it
                    String? url = article?.url;
                    if (url != null && url.isNotEmpty) {
                      setState(() {
                        LaunchURL(url);
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "View Full Article",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch the URL
  Future<void> LaunchURL(String url) async {
    Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }
}
