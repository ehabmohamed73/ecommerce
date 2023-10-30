import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummerSurprise extends StatelessWidget {
  const SummerSurprise({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    bool lang = (myServices.sharedpref.getString("lang") == "ar");
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text("41".tr,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Text("42".tr,
                style: const TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
        lang
            ? Positioned(
                top: -20,
                left: -20,
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      color: AppColor.secoundColor,
                      borderRadius: BorderRadius.circular(160)),
                ),
              )
            : Positioned(
                top: -20,
                right: -20,
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      color: AppColor.secoundColor,
                      borderRadius: BorderRadius.circular(160)),
                ),
              )
      ]),
    );
  }
}
