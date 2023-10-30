import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/controller/orders/pending_controller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/constants/imagesAssets.dart';
import 'package:ecommerceapp/data/model/ordersmodle.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orderslist extends StatelessWidget {
  const Orderslist({
    Key? key,
    required this.ordersModle,
    required this.listLength,
  }) : super(key: key);
  final OrdersModle ordersModle;
  final int listLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                flex: 5,
                child: Text(
                  "${ordersModle.ordersDate}",
                  style: const TextStyle(
                      fontSize: 19, color: AppColor.fourthColor),
                )),
            Expanded(
                child: Text("${ordersModle.ordersTotalprice}\$",
                    style: const TextStyle(
                        fontSize: 19, color: AppColor.secoundColor))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                flex: 5,
                child: ordersModle.ordersStatus == "1"
                    ? const Text(
                        "Delivered",
                        style: TextStyle(fontSize: 17, color: AppColor.gray),
                      )
                    : const Text(
                        "Wating to deliverd",
                        style: TextStyle(fontSize: 17, color: AppColor.gray),
                      )),
            const Expanded(
                child: Text("#2849",
                    style: TextStyle(fontSize: 16, color: AppColor.gray))),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            ...List.generate(
                2,
                (index) => Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: AppColor.gray,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        imagesAssets.avater,
                        width: 70,
                      ),
                    ))
          ],
        )
      ],

      // shrinkWrap: true,
    );
  }
}
