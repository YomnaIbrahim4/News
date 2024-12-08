import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/style/AppStyle.dart';
import 'package:news_app/ui/article_details/ArticleDetails.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/ui/searched_articles/SearchedArticles.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'News',
          theme: AppStyle.lightTheme,
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName:(_)=> HomeScreen(),
            ArticleDetails.routeName:(_)=> ArticleDetails(),
            SearchedArticles.routeName:(_)=> SearchedArticles(),
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
