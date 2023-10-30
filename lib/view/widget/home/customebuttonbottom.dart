import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class CustomeButtonBottom extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final IconData? icon;
  final bool? active;
  const CustomeButtonBottom(
      {Key? key,
      this.onPressed,
      required this.title,
      required this.icon,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? AppColor.primaryColor : AppColor.gray2,
          ),
          Text(
            title,
            style: TextStyle(
                color: active == true ? AppColor.primaryColor : AppColor.gray2),
          )
        ],
      ),
    );
  }
}
