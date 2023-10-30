import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/view/widget/home/categorieslist.dart';
import 'package:ecommerceapp/view/widget/custome_appbar.dart';
import 'package:ecommerceapp/view/widget/home/itemslist.dart';
import 'package:ecommerceapp/view/widget/home/summer_surprise.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? const LoadingCircular()
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
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
                  !controller.isSearch
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SummerSurprise(),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 20, color: AppColor.primaryColor),
                              ),
                            ),
                            const Categorieslist(),
                            const SizedBox(height: 20),
                            const Text("Product for you",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            const Itemslist(),
                            const Text("Products Most Selled",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            const Itemslist(),
                          ],
                        )
                      : SearchList(searchListItems: controller.searchlist),
                ],
              )),
    );
  }
}

class SearchList extends GetView<HomeControllerImp> {
  final List<ItemsModel> searchListItems;
  const SearchList({Key? key, required this.searchListItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchListItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              onTap: () {
                controller.goToPageProductDetails(searchListItems[index]);
              },
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Image.network(
                              "${AppLinks.itemsImages}/${searchListItems[index].itemImage}")),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text("${searchListItems[index].itemName}"),
                            subtitle:
                                Text("${searchListItems[index].categoryName}"),
                          )),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
