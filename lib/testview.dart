import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerceapp/controller/controller_test.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/constants/imagesAssets.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Title'),
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return Center(
            child: Lottie.asset(
              imagesAssets.loading,
              width: 255,
              height: 255,
            ),
          );
        } else if (controller.statusRequest == StatusRequest.serverFailure) {
          return Center(
            child: Lottie.asset(imagesAssets.server, width: 255, height: 255),
          );
        } else if (controller.statusRequest == StatusRequest.offlineFailure) {
          return Center(
            child: Lottie.asset(imagesAssets.offline, width: 255, height: 255),
          );
        } else if (controller.statusRequest == StatusRequest.failure) {
          return Center(
            child: Lottie.asset(imagesAssets.data,
                width: 255, height: 255, repeat: false),
          );
        } else {
          return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Text("${controller.data}"),
                );
              });
        }
      }),
    );
  }
}
