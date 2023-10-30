import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/functions/transelatedb.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CategorieslistItems extends GetView<ItemsControllerImp> {
  const CategorieslistItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        itemCount: controller.allCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.allCategories[index]));
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 10),
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectedCat = i;
        controller.catId = categoriesModel.categoryId;
        controller.getItemsData(controller.catId!);
        controller.update();
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 2, color: AppColor.secoundColor)))
                  : null,
              padding: const EdgeInsets.only(bottom: 3, right: 5),
              child: Text(
                "${transelateDb(categoriesModel.categoryNameAr, categoriesModel.categoryName)}",
                style:
                    const TextStyle(fontSize: 16, color: AppColor.fourthColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
