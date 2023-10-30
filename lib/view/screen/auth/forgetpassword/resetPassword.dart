import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/controller/auth/forgetpassword/ResetForgetPassword.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthButton.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthTitle.dart';
import 'package:ecommerceapp/view/widget/auth/coustomTextFormOuth.dart';
import 'package:ecommerceapp/view/widget/auth/coustomeAuthSubTitle.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';

import '../../../../core/functions/validateInput.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetForgetPasswordImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          title: const Text(
            "Reset Password",
            style: TextStyle(color: Color.fromARGB(255, 170, 163, 163)),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ResetForgetPasswordImp>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? const LoadingCircular()
              : Container(
                  decoration:
                      const BoxDecoration(color: AppColor.backgroundColor),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 1),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        coustomAuthTitle(text: '35'.tr),
                        const SizedBox(height: 10),
                        coustomeAuthSubTitle(text: '40'.tr),
                        const SizedBox(height: 50),
                        coustomTextFormOuth(
                          validFiled: (val) {
                            return validateInput(val!, 5, 15, 'password');
                          },
                          myController: controller.password,
                          textLable: '19'.tr,
                          textHint: '13'.tr,
                          textIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
                        coustomTextFormOuth(
                          validFiled: (val) {
                            return validateInput(val!, 5, 15, 'password');
                          },
                          myController: controller.confirmePassword,
                          textLable: '19'.tr,
                          textHint: '39'.tr,
                          textIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 10),
                        coustomAuthButton(
                          text: '33'.tr,
                          onPressed: () {
                            controller.ChangePassword();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
