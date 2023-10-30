import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/controller/auth/signupverfiycode.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/view/widget/auth/coustomAuthTitle.dart';
import 'package:ecommerceapp/view/widget/auth/coustomeAuthSubTitle.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';

class SignUpVerfiyCode extends StatelessWidget {
  const SignUpVerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpVerfiyCodeControllerImp());
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
        body: GetBuilder<SignUpVerfiyCodeControllerImp>(
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
                      coustomeAuthSubTitle(
                          text:
                              'your code has been sent to this email ${controller.email}'),
                      const SizedBox(height: 50),
                      OtpTextField(
                        borderRadius: BorderRadius.circular(10),

                        numberOfFields: 5,
                        borderColor: const Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.goToSuccessSignUp(verificationCode);
                        }, // end onSubmit
                      ),
                      const SizedBox(height: 50),
                      const coustomeAuthSubTitle(
                          text: 'I did\'t receve the code send it again'),

                      const SizedBox(height: 20),
                      SizedBox(
                        child: ElevatedButton(
                          // padding: const EdgeInsets.symmetric(vertical: 15),
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size(64, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: AppColor.fourthColor,
                              textStyle: const TextStyle(color: Colors.white)),

                          onPressed: () {
                            controller.resendCode();
                          },

                          child: const Text("Resend Code"),
                        ),
                      )
                    ],
                  )),
        ));
  }
}
