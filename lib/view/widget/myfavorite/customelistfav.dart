import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/controller/myfavoritecontroller.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/functions/transelatedb.dart';
import 'package:ecommerceapp/data/model/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomelistFavoriteitems extends GetView<MyFavoriteContrroler> {
  final MyFavoriteModel itemsModel;
  // final active;
  const CustomelistFavoriteitems({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   controller.goToPageProductDetails(itemsModel);
      // },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "${AppLinks.itemsImages}/${itemsModel.itemImage}",
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "${transelateDb(itemsModel.itemNameAr, itemsModel.itemName)}",
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.fourthColor,
                      // fontFamily: "PlayfairDisplay",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ...List.generate(
                      5,
                      (index) => const Icon(
                            Icons.star_border_outlined,
                            size: 18,
                          ))
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
                    IconButton(
                        onPressed: () {
                          controller.removeFromFavorite(itemsModel.favoriteId!);
                        },
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          color: AppColor.fourthColor,
                        )),
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
