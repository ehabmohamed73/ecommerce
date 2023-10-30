import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/view/widget/home/customebuttonbottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeBottonNav extends StatelessWidget {
  const CustomeBottonNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(children: [
          ...List.generate(
            controller.pages.length + 1,
            (index) => index == 2
                ? const Spacer()
                : CustomeButtonBottom(
                    active: controller.currentPage ==
                            (index > 2 ? index - 1 : index)
                        ? true
                        : false,
                    title: controller
                        .bottomAppApr[index > 2 ? index - 1 : index]["title"],
                    icon: controller.bottomAppApr[index > 2 ? index - 1 : index]
                        ["icon"],
                    onPressed: () {
                      controller.onChange(index > 2 ? index - 1 : index);
                    },
                  ),
          )
        ]),
      ),
    );
  }
}
