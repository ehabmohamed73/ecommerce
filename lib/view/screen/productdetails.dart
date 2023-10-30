import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import 'package:ecommerceapp/view/widget/productdetails/priceandcount.dart';
import 'package:ecommerceapp/view/widget/productdetails/subitemslist.dart';
import 'package:ecommerceapp/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.put(ProductDetailsController());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: AppColor.thirdColor,
                    onPressed: () {
                      Get.toNamed(AppRoots.cart);
                    },
                    child: const Text(
                      "Go To Cart",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: AppColor.fourthColor,
                    onPressed: () {
                      controller.addToCart(controller.itemsModel.itemId!);
                    },
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )),
        body: GetBuilder<ProductDetailsController>(
            builder: (controller) => controller.statusRequest ==
                    StatusRequest.loading
                ? const LoadingCircular()
                : ListView(children: [
                    const TopProductPageDetails(),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${controller.itemsModel.itemName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: AppColor.fourthColor,
                                    )),
                            const SizedBox(height: 10),
                            PriceAndCountItems(
                                onAdd: () {
                                  controller.addItemToCart();
                                },
                                onRemove: () {
                                  controller.removeItemFromCart();
                                },
                                price:
                                    "${controller.itemsModel.itemPriceAfterDis}",
                                count: controller.countItem.toString()),
                            const SizedBox(height: 10),
                            Text(
                                " ${controller.itemsModel.itemDesc} ${controller.itemsModel.itemDesc} ${controller.itemsModel.itemDesc} ${controller.itemsModel.itemDesc}",
                                style: Theme.of(context).textTheme.bodyText2),
                            const SizedBox(height: 10),
                            Text("Color",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: AppColor.fourthColor,
                                    )),
                            const SizedBox(height: 10),
                            const SubitemsList()
                          ]),
                    )
                  ])));
  }
}
