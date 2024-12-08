import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/ui/home/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  void Function(DrawerTabs) onPress;
  CustomDrawer({required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: REdgeInsets.symmetric(vertical: 43),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary
          ),
            child: Text(
                "News App !",
              style: Theme.of(context).textTheme.headlineMedium,
            )),
        SizedBox(height: 29.h,),
        InkWell(
          onTap: (){
            //show categories widget on home screen
            onPress(DrawerTabs.CATEGORIES);
          },
          child: Padding(
            padding: REdgeInsets.only(
              left: 16
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/icon_list.svg",
                  height: 22.h,
                  width: 25.w,
                ),
                SizedBox(width: 16.w,),
                Text(
                    "Categories",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 23.h,),
        InkWell(
          onTap: (){
            //show setting widget on home screen
            onPress(DrawerTabs.SETTINGS);
          },
          child: Padding(
            padding: REdgeInsets.only(
                left: 16
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/icon_settings.svg",
                  height: 22.h,
                  width: 25.w,
                ),
                SizedBox(width: 16.w,),
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
