import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/view/widget/cart/buttoncart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String shipping;
  final String discount;
  final String totalprice;

  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.shipping,
      required this.totalprice,
      required this.discount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text("price",
                              style: TextStyle(fontSize: 16))),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$price \$",
                              style: const TextStyle(fontSize: 16)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text("discount",
                              style: TextStyle(fontSize: 16))),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$discount",
                              style: const TextStyle(fontSize: 16)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text("Shipping",
                              style: TextStyle(fontSize: 16))),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$shipping \$",
                              style: const TextStyle(fontSize: 16)))
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text("Total Price",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor))),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$totalprice \$",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor)))
                    ],
                  ),
                ])),
            const SizedBox(height: 10),
            CustomButtonCart(
              textbutton: "Place Order",
              onPressed: () {
                controller.goToCheckOut();
              },
            )
          ],
        ));
  }
}
