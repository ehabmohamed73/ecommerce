import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/remotelogin.dart';

abstract class LoginController extends GetxController {
  Login();
  goToSignUp();
  goToCheckEmail();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email, password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool showHide = true;
  StatusRequest? statusRequest;
  RemoteLogIn remoteLogIn = RemoteLogIn(Get.find());
  MyServices myServices = Get.find();

  ShowPassword() {
    showHide = showHide == false ? true : false;
    update();
  }

  @override
  Login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var respons = await remoteLogIn.postLoginData(email.text, password.text);
      print("========================== controller $respons ");
      statusRequest = handlingData(respons);

      if (StatusRequest.success == statusRequest) {
        if (respons['status'] == "success") {
          if (respons['data']['user_approved'] == "1") {
            myServices.sharedpref.setString("id", respons['data']['user_id']);
            myServices.sharedpref
                .setString("username", respons['data']["user_name"]);
            myServices.sharedpref
                .setString("email", respons['data']["user_email"]);
            myServices.sharedpref
                .setString("phone", respons['data']["user_phone"]);
            myServices.sharedpref.setString("step", "2");
            Get.toNamed(AppRoots.homePage);
          } else {
            Get.toNamed(AppRoots.signupverfiycode,
                arguments: {"email": email.text});
          }
        } else {
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(
              title: "Warning", middleText: "email or password incorracte");
        }
      }
      update();
    } else {
      print('not Valide');
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoots.signUP);
  }

  @override
  goToCheckEmail() {
    Get.offNamed(AppRoots.forgetPassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
