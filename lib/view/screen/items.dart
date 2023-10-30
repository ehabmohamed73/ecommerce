import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:ecommerceapp/view/widget/custome_appbar.dart';
import 'package:ecommerceapp/view/widget/items/customelistitems.dart';
import 'package:ecommerceapp/view/widget/items/listcat_items.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteContrroler favoriteContrroler = Get.put(FavoriteContrroler());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<ItemsControllerImp>(
            builder: (controller) => controller.statusRequest ==
                    StatusRequest.loading
                ? const LoadingCircular()
                : ListView(
                    children: [
                      CustomeAppBar(
                        onPressedSearch: () {
                          controller.searchDone();
                        },
                        onChangedSeerch: (val) {
                          controller.isSearching(val);
                        },
                        searchText: controller.searchText!,
                        title: "Find Product",
                      ),
                      const SizedBox(height: 20),
                      const CategorieslistItems(),
                      !controller.isSearch
                          ? GridView.builder(
                              itemCount: controller.items.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.56),
                              itemBuilder: (context, i) {
                                favoriteContrroler.isFavorite[
                                        controller.items[i]["item_id"]] =
                                    controller.items[i]["favorite"];
                                return Customelistitems(
                                  itemsModel:
                                      ItemsModel.fromJson(controller.items[i]),
                                );
                              })
                          : SearchList(searchListItems: controller.searchlist),
                    ],
                  )),
      ),
    );
  }
}
