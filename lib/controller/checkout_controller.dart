import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:ecommerceapp/data/datasource/remote/checkout_data.dart';
import 'package:ecommerceapp/data/model/addressmodle.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));
  MyServices myServices = Get.find();

  StatusRequest? statusRequest;

  String? paymentMethod;
  String? deliveryType;
  String? couponDiscount;
  String addressid = "0";
  late String couponId, totalPrice;

  List<AddressModel> dataaddress = [];

  @override
  void onInit() {
    couponId = Get.arguments['couponId'];
    totalPrice = Get.arguments['totalPrice'];
    couponDiscount = Get.arguments['couponDiscount'].toString();
    getShippingAddress();
    super.onInit();
  }

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getAddressData(myServices.sharedpref.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Ooops", "Please Chose the Payment Methode");
    }
    if (deliveryType == null) {
      return Get.snackbar("Ooops", "Please Chose the Delevery Type Methode");
    }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "userId": myServices.sharedpref.getString("id"),
      "addressId": addressid.toString(),
      "orderType": deliveryType.toString(),
      "priceDelivery": "10",
      "orderPrice": totalPrice,
      "couponId": couponId,
      "payment": paymentMethod.toString(),
      "couponDiscount": couponDiscount.toString(),
    };

    var respons = await checkOutData.getCheckOutData(data);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.offAllNamed(AppRoots.homePage);
        Get.snackbar("yooo", "The Order Confirmed");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("ooops", "Try again");
      }
    }
    update();
  }
}
