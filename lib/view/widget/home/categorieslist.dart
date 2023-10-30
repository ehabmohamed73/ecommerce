import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/functions/transelatedb.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Categorieslist extends GetView<HomeControllerImp> {
  const Categorieslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 10),
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoryId!);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(90, 228, 154, 149),
                borderRadius: BorderRadius.circular(20)),
            width: 90,
            height: 100,
            child: SvgPicture.network(
              "${AppLinks.categoriesImages}/${categoriesModel.categoryImage}",
            ),
          ),
          Container(
            height: 30,
            child: Text(
                "${transelateDb(categoriesModel.categoryNameAr, categoriesModel.categoryName)}"),
          ),
        ],
      ),
    );
  }
}
