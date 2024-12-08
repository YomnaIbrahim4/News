import 'dart:ui';

class CategoryModel{
  String id;
  String title;
  String image;
  Color backGround;
  CategoryModel({required this.id,required this.title , required this.image , required this.backGround});

  static List<CategoryModel> categories = [
    CategoryModel(id: "sports", title: "Sports", image: "sports.png", backGround: Color(0xffC91C22)),
    CategoryModel(id: "general", title: "General", image: "Politics.png", backGround: Color(0xff003E90)),
    CategoryModel(id: "health", title: "Health", image: "health.png", backGround: Color(0xffED1E79)),
    CategoryModel(id: "business", title: "Business", image: "bussines.png", backGround: Color(0xffCF7E48)),
    CategoryModel(id: "technology", title: "Technology", image: "environment.png", backGround: Color(0xff4882CF)),
    CategoryModel(id: "science", title: "Science", image: "science.png", backGround: Color(0xffF2D352)),
  ];
}