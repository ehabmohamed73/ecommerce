import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/forgetpassword/remoteresertpassword.dart';

abstract class ResetForgetPassword extends GetxController {
  ChangePassword();
}

class ResetForgetPasswordImp extends ResetForgetPassword {
  late TextEditingController password, confirmePassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  RemoteRestPassword remoteRestPassword = RemoteRestPassword(Get.find());
  String? email;

  @override
  ChangePassword() async {
    if (password.text != confirmePassword.text) {
      return Get.defaultDialog(title: "Warning", middleText: "no match");
    } else {
      var formData = formState.currentState;
      if (formData!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var respons =
            await remoteRestPassword.postPasswordData(email!, password.text);
        print("========================== controller $respons ");
        statusRequest = handlingData(respons);

        if (StatusRequest.success == statusRequest) {
          if (respons['status'] == "success") {
            Get.toNamed(AppRoots.successResetPassword);
          } else {
            statusRequest = StatusRequest.failure;
            Get.defaultDialog(title: "Warning", middleText: "unexpected error");
          }
        }
        update();
      } else {
        print('not Valide');
      }
    }
  }

  @override
  void onInit() {
    confirmePassword = TextEditingController();
    password = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    confirmePassword.dispose();
    password.dispose();
    super.dispose();
  }
}
