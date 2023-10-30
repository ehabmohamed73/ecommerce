import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressedNotifi;
  final void Function(String)? onChangedSeerch;
  final void Function()? onPressedSearch;
  final TextEditingController searchText;
  const CustomeAppBar(
      {super.key,
      required this.title,
      this.onPressedNotifi,
      this.onChangedSeerch,
      required this.searchText,
      this.onPressedSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          controller: searchText,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: onPressedSearch,
                icon: const Icon(Icons.search),
              ),
              hintText: title,
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
          onChanged: onChangedSeerch,
        )),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 40,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedNotifi,
              icon: const Icon(
                Icons.notifications_active_outlined,
                size: 20,
                color: AppColor.fourthColor,
              )),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 40,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: () {
                Get.toNamed(AppRoots.myfavorite);
              },
              icon: const Icon(
                Icons.favorite_border_outlined,
                size: 20,
                color: AppColor.thirdColor,
              )),
        )
      ]),
    );
  }
}
