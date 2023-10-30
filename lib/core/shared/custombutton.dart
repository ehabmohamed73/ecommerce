import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 25, left: 20),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 5),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: AppColor.fourthColor,
        textColor: Colors.white,
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
