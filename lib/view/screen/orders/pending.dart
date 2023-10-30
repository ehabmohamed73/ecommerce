import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/controller/orders/pending_controller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/view/widget/custome_appbar.dart';
import 'package:ecommerceapp/view/widget/home/customebottonnav.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import 'package:ecommerceapp/view/widget/orders/orderslist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersPendingController controller = Get.put(OrdersPendingController());
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
    return Scaffold(
      bottomNavigationBar: const CustomeBottonNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoots.cart);
        },
        backgroundColor: AppColor.primaryColor,
        child: const Icon(Icons.shopping_cart_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child:
            ListView(physics: const NeverScrollableScrollPhysics(), children: [
          CustomeAppBar(
            onPressedSearch: () {
              homeControllerImp.searchDone();
            },
            onChangedSeerch: (val) {
              homeControllerImp.isSearching(val);
            },
            searchText: homeControllerImp.searchText!,
            title: "Search",
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          controller.sortOrders();
                        },
                        child: const Text("Sort"),
                      ),
                      const Icon(Icons.sort_by_alpha_rounded)
                    ],
                  ),
                )),
                const SizedBox(width: 15),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          controller.filterOrders();
                        },
                        child: const Text("Filter"),
                      ),
                      const Icon(Icons.filter_alt_outlined)
                    ],
                  ),
                )),
              ],
            ),
          ),

          GetBuilder<OrdersPendingController>(
              builder: (controller) =>
                  controller.statusRequest == StatusRequest.loading
                      ? const LoadingCircular()
                      : InkWell(
                          onTap: () {
                            controller.goToOrderDetials();
                          },
                          child: Container(
                              height: 550,
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ListView.builder(
                                itemCount: controller.orders.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => Orderslist(
                                    listLength: controller.orders.length,
                                    ordersModle: controller.orders[index]),
                              )),
                        ))

          // controller.delev == false
          //     ? Container(
          //         height: 550,
          //         padding: const EdgeInsets.only(bottom: 10),
          //         child: ListView.builder(
          //           itemCount: controller.orders.length,
          //           physics: const BouncingScrollPhysics(),
          //           itemBuilder: (context, index) => Orderslist(
          //               listLength: controller.orders.length,
          //               ordersModle: controller.orders[index]),
          //         ))
          //     : Container(
          //         height: 550,
          //         padding: const EdgeInsets.only(bottom: 10),
          //         child: ListView.builder(
          //           itemCount: controller.orders.length,
          //           physics: const BouncingScrollPhysics(),
          //           itemBuilder: (context, index) => Orderslist(
          //               listLength: controller.delivered.length,
          //               ordersModle: controller.delivered[index]),
          //         )),
        ]),
      ),
    );
  }
}
