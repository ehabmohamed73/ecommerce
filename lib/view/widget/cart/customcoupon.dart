import 'package:ecommerceapp/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';

class CustomCoupon extends StatelessWidget {
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const CustomCoupon(
      {Key? key, required this.controllercoupon, this.onApplyCoupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          Expanded(
              flex: 2,
              child: TextFormField(
                controller: controllercoupon,
                decoration: const InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    hintText: "Coupon Code",
                    border: OutlineInputBorder()),
              )),
          const SizedBox(width: 5),
          Expanded(
              flex: 1,
              child: CustomButtonCoupon(
                textbutton: "apply",
                onPressed: onApplyCoupon,
              ))
        ]));
  }
}
