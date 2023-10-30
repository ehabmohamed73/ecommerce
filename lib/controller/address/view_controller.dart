import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:ecommerceapp/data/model/addressmodle.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  StatusRequest? statusRequest;
  MyServices myServices = Get.find();
  List<AddressModel> addressModel = [];
  viewAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await addressData.getAddressData(
      myServices.sharedpref.getString("id")!,
    );
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List responsList = respons['data'];
        addressModel.addAll(responsList.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(String addressId) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await addressData.removeAddressData(addressId);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        addressModel.removeWhere((element) => element.addressId == addressId);
        Get.snackbar("OK", "Well Done");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }
}
