import 'package:ecommerceapp/controller/address/addressdetials_controller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/shared/custombutton.dart';
import 'package:ecommerceapp/view/widget/auth/coustomTextFormOuth.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addadressdetails extends StatelessWidget {
  const Addadressdetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressDetaitlsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Address Detials'),
        ),
        body: GetBuilder<AddressDetaitlsController>(
          builder: (controller) =>
              controller.statusRequest == StatusRequest.loading
                  ? const LoadingCircular()
                  : ListView(
                      padding: const EdgeInsets.all(15),
                      children: [
                        coustomTextFormOuth(
                            textLable: "City",
                            textHint: "City",
                            textIcon: Icons.location_city_outlined,
                            myController: controller.city,
                            validFiled: (val) {}),
                        const SizedBox(height: 15),
                        coustomTextFormOuth(
                            textLable: "Street",
                            textHint: "Street",
                            textIcon: Icons.streetview_outlined,
                            myController: controller.street,
                            validFiled: (val) {}),
                        const SizedBox(height: 15),
                        coustomTextFormOuth(
                            textLable: "Name",
                            textHint: "Name",
                            textIcon: Icons.location_on_outlined,
                            myController: controller.name,
                            validFiled: (val) {}),
                        const SizedBox(height: 15),
                        CustomButton(
                          text: "Add",
                          onPressed: () {
                            controller.addAddress();
                          },
                        )
                      ],
                    ),
        ));
  }
}
