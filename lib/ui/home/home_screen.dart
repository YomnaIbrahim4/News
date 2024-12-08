import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/ArticlesResponse/Article.dart';
import 'package:news_app/ui/categoriesWidget/CategoriesWidget.dart';
import 'package:news_app/ui/category_details/CategoryDetails.dart';
import 'package:news_app/ui/home/CustomDrawer.dart';
import 'package:news_app/ui/searched_articles/SearchedArticles.dart';
import 'package:news_app/ui/settingsWidget/SettingsWidget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesWidget(onPress: showCategoryDetailsWidget,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage( //provider
              "assets/images/background.png",
            ),
          fit: BoxFit.fill,
        )
      ),
      child: Scaffold(
        drawer: Drawer(
          child: CustomDrawer(
            onPress:selectDrawerItem,
          ),
        ),
        appBar: AppBar(
          title: Text("News App"),
          actions: [
            Padding(
              padding: REdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SearchedArticles.routeName);
                },
                child: Icon(
                  Icons.search,
                  size: 40.sp,
                ),
              ),
            )
          ],
        ),
        body: selectedWidget,

      ),
    );
  }

  selectDrawerItem(DrawerTabs value){
     switch(value){
      case DrawerTabs.CATEGORIES:{
        setState(() {
          selectedWidget = CategoriesWidget(
            onPress: showCategoryDetailsWidget,
          );
        });
        Navigator.pop(context);
      }
      case DrawerTabs.SETTINGS:{
        setState(() {
          selectedWidget = SettingsWidget();
        });
        Navigator.pop(context);
      }
    }
  }

  showCategoryDetailsWidget(String category){
    setState(() {
      selectedWidget = CategoryDetailsWidget(category: category,);
    });
  }
}


enum DrawerTabs{
  CATEGORIES,
  SETTINGS
}