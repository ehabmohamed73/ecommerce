import 'package:get/get.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoots.homePage);
  }
}
