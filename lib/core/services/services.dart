import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedpref;
  Future<MyServices> init() async {
    sharedpref = await SharedPreferences.getInstance();
    await Firebase.initializeApp();
    return this;
  }
}

intialServices() async {
  await Get.putAsync(() => MyServices().init());
}
