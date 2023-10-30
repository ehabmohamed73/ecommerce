import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';

class coustomeAuthSubTitle extends StatelessWidget {
  final String text;
  const coustomeAuthSubTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColor.gray),
        textAlign: TextAlign.center,
      ),
    );
  }
}
