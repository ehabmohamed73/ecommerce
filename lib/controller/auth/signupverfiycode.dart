import 'package:get/get.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/remotecheckcode.dart';

import '../../core/functions/handledata.dart';

abstract class SignUpVerfiyCodeController extends GetxController {
  CheckCode();
  //goToHomePage()
  goToSuccessSignUp(String verificationCode);
}

class SignUpVerfiyCodeControllerImp extends SignUpVerfiyCodeController {
  @override
  CheckCode() {}
  String? email;
  StatusRequest? statusRequest;
  RemoteCheckcode remoteCheckcode = RemoteCheckcode(Get.find());
  @override
  goToSuccessSignUp(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await remoteCheckcode.postCodeData(email!, verificationCode);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.toNamed(AppRoots.successSignUp);
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
            title: "Warning", middleText: "verificationCode not corracte");
      }
    }
    update();
  }

  resendCode() {
    remoteCheckcode.resendCodeData(email!);
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
