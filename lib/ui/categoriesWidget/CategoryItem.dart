import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel; // object from the model class to use the data inside it
  final int index;
  final void Function(String) onPress;
  CategoryItem({required this.categoryModel,required this.index,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // show category details widget
        onPress(categoryModel.id);// id is the same name of category in news api
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.backGround,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven?25.r:0),
            bottomRight: Radius.circular(index.isOdd?25.r:0),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/${categoryModel.image}", // full path
              height: 116.h,
              width: 132.w,
            ),
            SizedBox(height: 10.h,),
            Text(
              categoryModel.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 22.sp
              ),
            ),
          ],
        ),
      ),
    );
  }
}
