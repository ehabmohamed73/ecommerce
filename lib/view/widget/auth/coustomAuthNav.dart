import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';

class coustomAuthNav extends StatelessWidget {
  final String text1, text2;
  final void Function() onTap;
  const coustomAuthNav(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
