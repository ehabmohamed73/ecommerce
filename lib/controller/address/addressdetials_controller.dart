import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddressDetaitlsController extends GetxController {
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat, lng;
  AddressData addressData = AddressData(Get.find());
  StatusRequest? statusRequest;
  MyServices myServices = Get.find();
  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await addressData.addAddressData(
        myServices.sharedpref.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        lng!);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.snackbar("OK", "Well Done");
        Get.offAllNamed(AppRoots.homePage);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments["lat"];
    lng = Get.arguments["lng"];
    super.onInit();
  }
}
