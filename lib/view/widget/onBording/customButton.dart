import 'package:ecommerceapp/controller/onBordingController.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBording extends GetView<OnBordingControllerImp> {
  const CustomButtonOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      height: 70,
      margin: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        textColor: Colors.white,
        color: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        child: Text("8".tr),
      ),
    );
  }
}
