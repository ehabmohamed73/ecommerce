import 'package:flutter/material.dart';

class coustomAuthTitle extends StatelessWidget {
  final String text;
  const coustomAuthTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}
