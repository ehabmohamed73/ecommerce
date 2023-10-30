import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // height: 20,
      decoration: BoxDecoration(
          color: AppColor.fourthColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: AppColor.black,
              offset: Offset(
                0,
                1.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 0.5,
            ),
          ]),
      child: Text(message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColor.backgroundColor)),
    );
  }
}
