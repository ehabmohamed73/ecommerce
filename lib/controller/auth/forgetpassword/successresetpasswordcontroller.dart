import 'package:get/get.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoots.logIn);
  }
}
