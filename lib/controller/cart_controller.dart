import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/cart_data.dart';
import 'package:ecommerceapp/data/model/cartmodel.dart';
import 'package:ecommerceapp/data/model/couponmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  StatusRequest? statusRequest;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  List<CartModel> cartView = [];
  double totalPrice = 0.0;
  int totalCountItems = 0;
  TextEditingController? controllercoup;
  CouponModle? couponModle;
  int? couponDiscount = 0;
  String? couponName;
  String? couponId;

  @override
  void onInit() {
    viewFromCart();
    controllercoup = TextEditingController();
    super.onInit();
  }

  goToCheckOut() {
    if (cartView.isEmpty) {
      return Get.snackbar("Opps", "Cart is Empty");
    }
    Get.toNamed(AppRoots.checkout, arguments: {
      "couponId": couponId ?? "0",
      "totalPrice": totalPrice.toString(),
      "couponDiscount": couponDiscount.toString()
    });
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await cartData.checkCouponData(controllercoup!.text.trim());
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Map<String, dynamic> couponData = respons['data'];
        couponModle = CouponModle.fromJson(couponData);
        couponDiscount = int.parse(couponModle!.couponDiscount!);
        couponName = couponModle!.couponName;
        couponId = couponModle!.couponId;
      } else {
        // statusRequest = StatusRequest.failure;
        couponDiscount = 0;
        couponName = null;
        couponId = null;
        Get.snackbar("Oppps", "Invalid Coupon");
      }
    }
    update();
  }

  getTotalPrice() {
    return (totalPrice - (totalPrice * couponDiscount! / 100));
  }

  addToCart(String cartItemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await cartData.addCart(
        myServices.sharedpref.getString("id")!, cartItemId);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.snackbar("Alert", "added to Cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  removeFromCart(String cartItemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await cartData.removeCart(
        myServices.sharedpref.getString("id")!, cartItemId);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.snackbar("Alert", "removed From Cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  viewFromCart() async {
    // favData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons =
        await cartData.viewCart(myServices.sharedpref.getString("id")!);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        if (respons['cartdata']['status'] == "success") {
          List responsList = respons['cartdata']["data"];
          cartView.addAll(responsList.map((e) => CartModel.fromJson(e)));
          Map priceCount = respons["countprice"];
          totalCountItems = int.parse(priceCount["totalCount"]);
          totalPrice = double.parse(priceCount["totalPrice"]);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resetData() {
    totalCountItems = 0;
    totalPrice = 0.0;
    cartView.clear();
  }

  refreshPage() {
    resetData();
    viewFromCart();
  }
}
