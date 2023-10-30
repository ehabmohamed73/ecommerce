import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  int? get Priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedpref.getString('step') == '2') {
      return const RouteSettings(name: AppRoots.homePage);
    }
    if (myServices.sharedpref.getString('step') == '1') {
      return const RouteSettings(name: AppRoots.logIn);
    }
    return null;
  }
}
