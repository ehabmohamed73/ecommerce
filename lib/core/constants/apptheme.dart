import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[50],
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColor.primaryColor),
    titleTextStyle: const TextStyle(color: AppColor.primaryColor, fontSize: 25),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.fourthColor),
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyText1: TextStyle(
          height: 2,
          color: AppColor.gray,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyText2: TextStyle(height: 2, color: AppColor.gray, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyText1: TextStyle(
          height: 2,
          color: AppColor.gray,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyText2: TextStyle(height: 2, color: AppColor.gray, fontSize: 14)),
  primarySwatch: Colors.blue,
);
