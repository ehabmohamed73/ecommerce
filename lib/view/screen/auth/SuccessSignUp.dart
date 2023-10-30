import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/controller/auth/successsignupcontroller.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthButton.dart';

import '../../../core/constants/appColors.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controllerImp =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title: Text('32'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColor.gray)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColor.primaryColor,
          )),
          Text("37".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          Text("38".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: coustomAuthButton(
                text: "31".tr,
                onPressed: () {
                  controllerImp.goToLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
