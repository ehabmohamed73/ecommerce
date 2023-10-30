import 'package:get/get.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/forgetpassword/remotecheckforgetpasswordcode.dart';

import '../../../core/classes/statusrequest.dart';

abstract class VerfiyCodeController extends GetxController {
  CheckCode();
  goToRestPassword(String verificationCode);
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  @override
  CheckCode() {}
  String? email;
  StatusRequest? statusRequest;
  RemoteCheckForgetPasswordCode remoteCheckForgetPasswordCode =
      RemoteCheckForgetPasswordCode(Get.find());

  @override
  goToRestPassword(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await remoteCheckForgetPasswordCode.postCodeData(
        email!, verificationCode);
    print("========================== controller $respons ");
    print("========================== VerfiyCodeController ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.toNamed(AppRoots.resetPassword, arguments: {"email": email});
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
            title: "Warning", middleText: "verificationCode not corracte");
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
