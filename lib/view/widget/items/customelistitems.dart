import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/functions/transelatedb.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customelistitems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final active;
  const Customelistitems({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: "${itemsModel.itemId}",
                  child: Image.network(
                    "${AppLinks.itemsImages}/${itemsModel.itemImage}",
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "${transelateDb(itemsModel.itemNameAr, itemsModel.itemName)}",
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.fourthColor,
                      fontFamily: "PlayfairDisplay",
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              // Text(
              //   "${itemsModel.categoryName}",
              //   textAlign: TextAlign.center,
              //   style: const TextStyle(
              //       color: AppColor.gray, fontFamily: "PlayfairDisplay"),
              // ),
              itemsModel.itemDiscount != "0"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${itemsModel.itemPrice}\$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: "sans",
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star_border_outlined,
                                      size: 18,
                                    )),
                          ],
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star_border_outlined,
                                  size: 18,
                                )),
                      ],
                    ),
              Container(
                margin: const EdgeInsets.only(
                  top: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${itemsModel.itemPriceAfterDis}\$",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontFamily: "sans",
                            fontSize: 16)),
                    GetBuilder<FavoriteContrroler>(
                      builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemsModel.itemId] ==
                                "1") {
                              controller.serFavorite(itemsModel.itemId, "0");
                              controller.removeFromFavorite(itemsModel.itemId!);
                            } else {
                              controller.serFavorite(itemsModel.itemId, "1");
                              controller.addToFavorite(itemsModel.itemId!);
                            }
                          },
                          icon: Icon(
                            controller.isFavorite[itemsModel.itemId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_outline_outlined,
                            color: AppColor.primaryColor,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
