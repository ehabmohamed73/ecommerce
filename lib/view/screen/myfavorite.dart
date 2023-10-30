import 'package:ecommerceapp/controller/myfavoritecontroller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import 'package:ecommerceapp/view/widget/myfavorite/customelistfav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Myfavorite extends StatelessWidget {
  const Myfavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteContrroler());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteContrroler>(
            builder: (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? const LoadingCircular()
                    : ListView(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          // const CustomeAppBar(searchText: ),
                          GridView.builder(
                              itemCount: controller.favData.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.6),
                              itemBuilder: (context, i) {
                                return CustomelistFavoriteitems(
                                  itemsModel: controller.favData[i],
                                );
                              })
                        ],
                      ),
          )),
    );
  }
}
