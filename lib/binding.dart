import 'package:get/get.dart';
import 'package:ecommerceapp/controller/auth/signupcontroller.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => signupControllerImp(), fenix: true);
    Get.put(Crud());
  }
}
