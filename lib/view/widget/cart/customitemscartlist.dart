import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/constants/imagesAssets.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imageUrl;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imageUrl,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(children: [
          Expanded(
              flex: 2,
              child: Image.network(
                "${AppLinks.itemsImages}/$imageUrl",
                height: 90,
                fit: BoxFit.cover,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: TextStyle(fontSize: 15)),
                subtitle: Text(price,
                    style: const TextStyle(
                        color: AppColor.primaryColor, fontSize: 17)),
              )),
          Expanded(
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 35,
                  child: IconButton(onPressed: onAdd, icon: Icon(Icons.add))),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 25,
                  child: Text(
                    count,
                    style: TextStyle(fontFamily: "sans"),
                  )),
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 25,
                  child: IconButton(
                      onPressed: onRemove, icon: const Icon(Icons.remove)))
            ],
          ))
        ]),
      ),
    );
  }
}
