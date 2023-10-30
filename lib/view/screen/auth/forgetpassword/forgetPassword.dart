import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthButton.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthTitle.dart';
import 'package:ecommerceapp/view/widget/auth/coustomTextFormOuth.dart';
import 'package:ecommerceapp/view/widget/auth/coustomeAuthSubTitle.dart';
import 'package:ecommerceapp/view/widget/auth/logoAuth.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';

import '../../../../controller/auth/forgetpassword/forgetPasswordController.dart';
import '../../../../core/functions/validateInput.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          title: Text(
            "14".tr,
            style: const TextStyle(color: Color.fromARGB(255, 170, 163, 163)),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
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
                        coustomAuthTitle(text: '27'.tr),
                        const SizedBox(height: 10),
                        coustomeAuthSubTitle(text: '29'.tr),
                        const SizedBox(height: 50),
                        coustomTextFormOuth(
                          validFiled: (val) {
                            return validateInput(val!, 5, 30, 'email');
                          },
                          myController: controllerImp.email,
                          textLable: '18'.tr,
                          textHint: '12'.tr,
                          textIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 10),
                        coustomAuthButton(
                          text: '30'.tr,
                          onPressed: () {
                            controllerImp.CheckEmail();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
