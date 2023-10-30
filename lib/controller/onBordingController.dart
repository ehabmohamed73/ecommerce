import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBordingControllerImp extends OnBordingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myservices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage >= bordingModleList.length) {
      Get.offAllNamed(AppRoots.logIn);
      myservices.sharedpref.setString('step', "1");
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
