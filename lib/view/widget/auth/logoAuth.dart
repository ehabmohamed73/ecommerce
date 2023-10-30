import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/constants/imagesAssets.dart';

class logoAuth extends StatelessWidget {
  const logoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagesAssets.logo,
      height: 150,
    );
  }
}
