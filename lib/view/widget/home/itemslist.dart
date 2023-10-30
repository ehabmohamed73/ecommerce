import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemslist extends GetView<HomeControllerImp> {
  const Itemslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Items(itemsModel: ItemsModel.fromJson(controller.items[i]));
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "${AppLinks.itemsImages}/${itemsModel.itemImage}",
                height: 140,
                width: 150,
                fit: BoxFit.fill,
              ),
            )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)),
          height: 160,
          width: 190,
        ),
        Positioned(
            left: 30,
            top: 60,
            child: Text(
              "${itemsModel.itemName}",
              style: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 14),
            ))
      ],
    );
  }
}
