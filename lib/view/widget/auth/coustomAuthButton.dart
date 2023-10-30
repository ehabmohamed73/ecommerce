import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';

class coustomAuthButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const coustomAuthButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 15),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
