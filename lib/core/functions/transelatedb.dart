import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

transelateDb(arLang, enLang) {
  MyServices myServices = Get.find();
  if (myServices.sharedpref.getString("lang") == "ar") {
    return arLang;
  } else {
    return enLang;
  }
}
