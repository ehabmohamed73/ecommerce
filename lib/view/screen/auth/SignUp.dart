import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/controller/auth/signupcontroller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/functions/exitalert.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthButton.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthNav.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthTitle.dart';
import 'package:ecommerceapp/view/widget/auth/coustomTextFormOuth.dart';
import 'package:ecommerceapp/view/widget/auth/coustomeAuthSubTitle.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import '../../../core/functions/validateInput.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(signupControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          title: Text(
            "17".tr,
            style: const TextStyle(color: Color.fromARGB(255, 170, 163, 163)),
          ),
          centerTitle: true,
        ),
        body: WillPopScope(
          onWillPop: AlertExitApp,
          child: GetBuilder<signupControllerImp>(
            builder: (controllerImp) => controllerImp.statusRequest ==
                    StatusRequest.loading
                ? const LoadingCircular()
                : Container(
                    decoration:
                        const BoxDecoration(color: AppColor.backgroundColor),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 1),
                    child: Form(
                      key: controllerImp.formState,
                      child: ListView(
                        children: [
                          coustomAuthTitle(text: '10'.tr),
                          const SizedBox(height: 10),
                          coustomeAuthSubTitle(text: '24'.tr),
                          const SizedBox(height: 50),
                          coustomTextFormOuth(
                            keyboardType: TextInputType.text,
                            validFiled: (val) {
                              return validateInput(val!, 4, 8, 'username');
                            },
                            myController: controllerImp.username,
                            textLable: '20'.tr,
                            textHint: '23'.tr,
                            textIcon: Icons.person_outline_outlined,
                          ),
                          const SizedBox(height: 20),
                          coustomTextFormOuth(
                            keyboardType: TextInputType.number,
                            validFiled: (val) {
                              return validateInput(val!, 5, 9, 'phone');
                            },
                            myController: controllerImp.phone,
                            textLable: '21'.tr,
                            textHint: '22'.tr,
                            textIcon: Icons.phone_enabled,
                          ),
                          const SizedBox(height: 20),
                          coustomTextFormOuth(
                            keyboardType: TextInputType.emailAddress,
                            validFiled: (val) {
                              return validateInput(val!, 5, 30, 'email');
                            },
                            myController: controllerImp.email,
                            textLable: '18'.tr,
                            textHint: '12'.tr,
                            textIcon: Icons.email_outlined,
                          ),
                          const SizedBox(height: 20),
                          GetBuilder<signupControllerImp>(
                            builder: (controllerImp) => coustomTextFormOuth(
                              isObscureText: controllerImp.showHide,
                              onTapIcon: () {
                                controllerImp.ShowPassword();
                              },
                              validFiled: (val) {
                                return validateInput(val!, 5, 15, 'password');
                              },
                              myController: controllerImp.password,
                              textLable: '19'.tr,
                              textHint: '13'.tr,
                              textIcon: Icons.lock_outline,
                            ),
                          ),
                          const SizedBox(height: 10),
                          coustomAuthButton(
                            text: '17'.tr,
                            onPressed: () {
                              controllerImp.signUp();
                            },
                          ),
                          const SizedBox(height: 10),
                          coustomAuthNav(
                            text1: "25".tr,
                            text2: "26".tr,
                            onTap: () {
                              controllerImp.goToLogin();
                            },
                          )
                        ],
                      ),
                    )),
          ),
        ));
  }
}
