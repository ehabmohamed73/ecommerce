import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/cart_data.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  late ItemsModel itemsModel;
  // CartController cartController = Get.put(CartController());
  late StatusRequest statusRequest;
  int countItem = 0;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];
  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countItem = await getItemCount(itemsModel.itemId!);
    statusRequest = StatusRequest.success;
    update();
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

  getItemCount(String cartItemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await cartData.itemCount(
        myServices.sharedpref.getString("id")!, cartItemId);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);
    int itemCount = 0;
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        itemCount = int.parse(respons['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    return itemCount;
  }

  addItemToCart() {
    addToCart(itemsModel.itemId!);
    countItem++;
    update();
  }

  removeItemFromCart() {
    if (countItem > 0) {
      countItem--;
      removeFromCart(itemsModel.itemId!);
      update();
    }
  }
}
