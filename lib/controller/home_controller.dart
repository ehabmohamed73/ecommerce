import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/home_data.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  getData();
  goToItems(List allCategories, int selectedCat, String catId);
}

class HomeControllerImp extends SearchMixController {
  MyServices myServices = Get.find();
  String? username;
  List categories = [];
  List items = [];

  StatusRequest? statusRequest;
  HomeData homeData = HomeData(Get.find());

  @override
  void onInit() {
    getData();
    username = myServices.sharedpref.getString("username");
    searchText = TextEditingController();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await homeData.getData();
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        categories.addAll(respons['categories']["data"]);
        items.addAll(respons['items']["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToItems(allCategories, selectedCat, catId) {
    Get.toNamed(AppRoots.items, arguments: {
      "allCategories": allCategories,
      "selectedCat": selectedCat,
      "catId": catId,
    });
  }
}

class SearchMixController extends GetxController {
  TextEditingController? searchText;
  StatusRequest? statusRequest;
  HomeData homeData = HomeData(Get.find());
  bool isSearch = false;
  List<ItemsModel> searchlist = [];
  getSearchData() async {
    searchlist.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons = await homeData.searchData(searchText!.text);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List responsList = respons['data'];
        searchlist.addAll(responsList.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  isSearching(val) {
    if (val == "") {
      isSearch = false;
      update();
    }
  }

  searchDone() {
    if (searchText!.text != "") {
      isSearch = true;
      getSearchData();
      update();
    }
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
