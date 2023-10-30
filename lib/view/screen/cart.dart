import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommerceapp/view/widget/cart/customcoupon.dart';
import 'package:ecommerceapp/view/widget/cart/customitemscartlist.dart';
import 'package:ecommerceapp/view/widget/cart/topcardcart.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Cart",
          ),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => BottomNavgationBarCart(
            price: "${controller.totalPrice}",
            shipping: "300",
            discount: "${controller.couponDiscount}",
            totalprice: " ${controller.getTotalPrice()}",
          ),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? const LoadingCircular()
              : ListView(
                  children: [
                    // const TopAppbarCart(
                    //   title: 'My Cart',
                    // ),
                    const SizedBox(height: 10),
                    TopCardCart(
                        message:
                            "You Have ${controller.totalCountItems} Items in Your List"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            controller.cartView.length,
                            (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await controller.addToCart(
                                      controller.cartView[index].itemId!);
                                  controller.refreshPage();
                                },
                                onRemove: () async {
                                  await controller.removeFromCart(
                                      controller.cartView[index].itemId!);
                                  controller.refreshPage();
                                },
                                imageUrl:
                                    "${controller.cartView[index].itemImage}",
                                name: "${controller.cartView[index].itemName}",
                                price:
                                    "${controller.cartView[index].itemsPrice} \$",
                                count:
                                    "${controller.cartView[index].itemsCount}"),
                          )
                        ],
                      ),
                    ),
                    controller.couponName == null
                        ? CustomCoupon(
                            controllercoupon: controller.controllercoup!,
                            onApplyCoupon: () {
                              controller.checkCoupon();
                            },
                          )
                        : Center(
                            child: Text(
                              "Coupon Code: ${controller.couponName!}",
                              style: const TextStyle(
                                  color: AppColor.fourthColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                  ],
                ),
        ));
  }
}
