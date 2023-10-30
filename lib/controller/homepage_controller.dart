import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:ecommerceapp/view/screen/orders/pending.dart';
import 'package:ecommerceapp/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends GetxController {
  onChange(int page);
  showlang();
}

class HomePageControllerImp extends HomePageController {
  int currentPage = 0;
  MyServices myServices = Get.find();
  List<Widget> pages = [
    const Home(),
    const PendingOrders(),
    const Settings(),
    Column(
      children: const [
        Text("profile"),
      ],
    ),
  ];
  List bottomAppApr = [
    {"title": "Home", "icon": Icons.home_outlined},
    {"title": "Orders", "icon": Icons.shopping_cart_outlined},
    {"title": "Setting", "icon": Icons.settings},
    {"title": "Profile", "icon": Icons.person},
  ];
  // List<IconData> iconsList = const [
  //   (Icons.home_outlined),
  //   (Icons.category_outlined),
  //   (Icons.settings),
  //   (Icons.person_2_outlined)
  // ];
  @override
  onChange(int page) {
    currentPage = page;
    update();
  }

  @override
  showlang() {
    print(myServices.sharedpref.getString("lang"));
  }
}
