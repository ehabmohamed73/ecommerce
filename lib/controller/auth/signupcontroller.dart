import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/remotesignup.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/functions/handledata.dart';

abstract class Signupcontroller extends GetxController {
  signUp();
  goToLogin();
  goToVerfiyCode();
}

class signupControllerImp extends Signupcontroller {
  late TextEditingController email, password, username, phone;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool showHide = true;
  RemoteSignUp remoteSignUp = RemoteSignUp(Get.find());
  List data = [];
  StatusRequest? statusRequest;
  ShowPassword() {
    showHide = showHide == false ? true : false;
    update();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoots.logIn);
  }

  @override
  goToVerfiyCode() {
    Get.toNamed(AppRoots.signupverfiycode);
  }

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var respons = await remoteSignUp.postSignupData(
          username.text, email.text, password.text, phone.text);
      print("========================== controller $respons ");
      statusRequest = handlingData(respons);

      if (StatusRequest.success == statusRequest) {
        if (respons['status'] == "success") {
          // data.addAll(respons['data']);
          Get.toNamed(AppRoots.signupverfiycode,
              arguments: {"email": email.text});
        } else {
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(
              title: "Warning", middleText: "email or phone already existe");
        }
      }
    } else {
      print('not Valide');
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
