import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/CategoryModel.dart';
import 'package:news_app/ui/categoriesWidget/CategoryItem.dart';

class CategoriesWidget extends StatelessWidget {
  final void Function(String category) onPress;
  CategoriesWidget({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('''Pick your category 
of interest''',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 29.h,),
          Expanded(
            child: GridView.builder(
              itemCount: CategoryModel.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 1/1,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 25.h
                ),
                itemBuilder: (context, index) => CategoryItem(
                  onPress: onPress,
                    categoryModel: CategoryModel.categories[index],
                    index: index),
            ),
          )

        ],
      ),
    );
  }
}
