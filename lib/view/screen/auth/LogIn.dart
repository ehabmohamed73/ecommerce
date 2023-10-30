import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/controller/auth/logincontroller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/functions/exitalert.dart';
import 'package:ecommerceapp/core/functions/validateInput.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthButton.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthNav.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthTitle.dart';
import 'package:ecommerceapp/view/widget/auth/coustomTextFormOuth.dart';
import 'package:ecommerceapp/view/widget/auth/coustomeAuthSubTitle.dart';
import 'package:ecommerceapp/view/widget/auth/logoAuth.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title: const Text(
          "LogIn",
          style: TextStyle(color: Color.fromARGB(255, 170, 163, 163)),
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: AlertExitApp,
        child: GetBuilder<LoginControllerImp>(
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
                        const logoAuth(),
                        coustomAuthTitle(text: '10'.tr),
                        const SizedBox(height: 10),
                        coustomeAuthSubTitle(text: '11'.tr),
                        const SizedBox(height: 50),
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
                        GetBuilder<LoginControllerImp>(
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
                        InkWell(
                          onTap: () {
                            controllerImp.goToCheckEmail();
                          },
                          child: Text(
                            '14'.tr,
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(height: 10),
                        coustomAuthButton(
                          text: '15'.tr,
                          onPressed: () {
                            controllerImp.Login();
                          },
                        ),
                        const SizedBox(height: 10),
                        coustomAuthNav(
                          text1: "16".tr,
                          text2: "17".tr,
                          onTap: () {
                            controllerImp.goToSignUp();
                          },
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
