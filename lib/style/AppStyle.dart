import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/main.dart';
import 'package:news_app/style/AppColors.dart';

class AppStyle{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 35.sp
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r)
        )
      ),
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22.sp,
        color: Colors.white
      )
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      primary: AppColors.primaryColor
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700
      ),
      titleMedium: TextStyle(
        color: AppColors.iconColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: AppColors.greyColor,
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
          fontSize: 13.sp
      ),
      displayLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp
      ),
      displayMedium: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
          fontSize: 15.sp
      ),
      bodyMedium: TextStyle(
  color: Color(0xff42505C),
  fontSize: 15.sp,
  fontWeight: FontWeight.w300,
    ),
      labelMedium: TextStyle(
        color: Colors.grey,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500
      )
    ),

    useMaterial3: true,
  );
}