import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class CardShppingAddressCheckout extends StatelessWidget {
  final String title;
  final String city;
  final String street;
  final bool isactive;
  const CardShppingAddressCheckout(
      {Key? key,
      required this.title,
      required this.isactive,
      required this.city,
      required this.street})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isactive ? AppColor.secoundColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title,
            style: TextStyle(
                color: isactive ? Colors.white : null,
                fontWeight: FontWeight.bold)),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              city,
              style: TextStyle(
                  color: isactive ? Colors.white : null,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              street,
              style: TextStyle(
                  color: isactive ? Colors.white : null,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
