import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/controller/auth/forgetpassword/VerfiyCodeController.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthTitle.dart';
import 'package:ecommerceapp/view/widget/auth/coustomeAuthSubTitle.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          title: const Text(
            "Verfiycation ",
            style: TextStyle(color: Color.fromARGB(255, 170, 163, 163)),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<VerfiyCodeControllerImp>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? const LoadingCircular()
              : Container(
                  decoration:
                      const BoxDecoration(color: AppColor.backgroundColor),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 1),
                  child: ListView(
                    children: [
                      // const logoAuth(),
                      const coustomAuthTitle(text: 'Verfiycation code'),
                      const SizedBox(height: 10),
                      const coustomeAuthSubTitle(
                          text: 'your code has been sent to your email'),
                      const SizedBox(height: 50),
                      OtpTextField(
                        borderRadius: BorderRadius.circular(10),

                        numberOfFields: 5,
                        borderColor: Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.goToRestPassword(verificationCode);
                        }, // end onSubmit
                      ),
                    ],
                  )),
        ));
  }
}
