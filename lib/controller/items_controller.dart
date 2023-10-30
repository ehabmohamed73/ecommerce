import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/items_data.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  getItemsData(String catId);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List allCategories = [];
  int? selectedCat;
  StatusRequest? statusRequest;
  ItemsData itemsData = ItemsData(Get.find());
  List items = [];
  String? catId;
  MyServices myServices = Get.find();
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() {
    searchText = TextEditingController();
    allCategories = Get.arguments["allCategories"];
    selectedCat = Get.arguments["selectedCat"];
    catId = Get.arguments["catId"];
    getItemsData(catId!);
  }

  getItemsData(catId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var respons =
        await itemsData.getData(catId, myServices.sharedpref.getString("id")!);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        items.addAll(respons['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
