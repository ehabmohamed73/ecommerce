import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/core/services/services.dart';

import '../constants/apptheme.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = ThemeData();
  changeLang(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedpref.setString('lang', languageCode);
    appTheme = (languageCode == "ar") ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
    }
  }

  @override
  void onInit() {
    requestPerLocation();
    if (myServices.sharedpref.getString('lang') == 'ar') {
      language = const Locale('ar');
      appTheme = themeArabic;
      update();
    } else if (myServices.sharedpref.getString('lang') == 'en') {
      language = const Locale('en');
      appTheme = themeEnglish;
      update();
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
      update();
    }
    update();
    super.onInit();
  }
}
