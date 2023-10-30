import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/forgetpassword/remotecheckemail.dart';

import '../../../core/classes/statusrequest.dart';
import '../../../core/functions/handledata.dart';

abstract class ForgetPasswordController extends GetxController {
  CheckEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest? statusRequest;
  RemoteCheckEmail remoteCheckEmail = RemoteCheckEmail(Get.find());
  @override
  CheckEmail() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var respons = await remoteCheckEmail.postEmailData(email.text);
      print("========================== controller $respons ");
      statusRequest = handlingData(respons);
      if (StatusRequest.success == statusRequest) {
        if (respons['status'] == "success") {
          // data.addAll(respons['data']);
          Get.toNamed(AppRoots.verfyCode, arguments: {"email": email.text});
        } else {
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(
              title: "Warning",
              middleText: "the email you have entered not existe");
        }
      }
      update();
    } else {
      print('not Valide');
    }
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
