import 'package:ecommerceapp/controller/onBordingController.dart';
import 'package:ecommerceapp/view/widget/onBording/customButton.dart';
import 'package:ecommerceapp/view/widget/onBording/customSlider.dart';
import 'package:ecommerceapp/view/widget/onBording/dotController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onBording extends StatelessWidget {
  const onBording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(flex: 3, child: CustomSliderOnBordng()),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    dotControllerOnBording(),
                    Spacer(flex: 2),
                    CustomButtonOnBording(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
