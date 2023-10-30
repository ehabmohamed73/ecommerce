import 'package:ecommerceapp/controller/address/view_controller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/data/model/addressmodle.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('address'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoots.addressadd);
          },
          child: Icon(Icons.add)),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<AddressViewController>(
            builder: (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? const LoadingCircular()
                    : ListView.builder(
                        itemCount: controller.addressModel.length,
                        itemBuilder: (context, index) {
                          return View(
                            addressModel: controller.addressModel[index],
                            onPressed: () {
                              controller.deleteAddress(
                                  controller.addressModel[index].addressId!);
                            },
                          );
                        },
                      )),
      ),
    );
  }
}

class View extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onPressed;
  const View({Key? key, required this.addressModel, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(addressModel.addressName!),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("City : ${addressModel.addressCity!}"),
            Text("Street : ${addressModel.addressStreet!}"),
          ],
        ),
        trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.remove_done_rounded,
              color: AppColor.secoundColor,
            )),
      ),
    );
  }
}
