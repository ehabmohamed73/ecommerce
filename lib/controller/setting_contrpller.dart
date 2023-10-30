import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    myServices.sharedpref.remove("username");
    myServices.sharedpref.remove("email");
    myServices.sharedpref.remove("phone");
    myServices.sharedpref.setString("step", "1");
    Get.offAllNamed(AppRoots.logIn);
  }
}
