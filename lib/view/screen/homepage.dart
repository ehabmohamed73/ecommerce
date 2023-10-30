import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/functions/exitalert.dart';
import 'package:ecommerceapp/view/widget/home/customebottonnav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
        builder: (controller) => Scaffold(
              // backgroundColor: Color.fromARGB(96, 150, 135, 135),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(AppRoots.cart);
                },
                backgroundColor: AppColor.primaryColor,
                child: const Icon(Icons.shopping_cart_outlined),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomeBottonNav(),
              body: WillPopScope(
                  onWillPop: AlertExitApp,
                  child: controller.pages.elementAt(controller.currentPage)),
            ));
  }
}
