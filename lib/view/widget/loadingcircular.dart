import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';

class LoadingCircular extends StatelessWidget {
  const LoadingCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColor.primaryColor),
    );
  }
}
