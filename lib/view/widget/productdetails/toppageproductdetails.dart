import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsController> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            height: 200,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 99, 30, 22),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)))),
        Positioned(
            top: 40.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${controller.itemsModel.itemId}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "${AppLinks.itemsImages}/${controller.itemsModel.itemImage!}",
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
            ))
      ],
    );
  }
}
