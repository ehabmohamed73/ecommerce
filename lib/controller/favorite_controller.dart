import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/favorite_data.dart';
import 'package:ecommerceapp/data/model/myfavorite.dart';
import 'package:get/get.dart';

class FavoriteContrroler extends GetxController {
  Map isFavorite = {};
  List<MyFavoriteModel> favData = [];
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  FavoriteData favoriteData = FavoriteData(Get.find());

  serFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addToFavorite(String favItemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await favoriteData.addFavorite(
        myServices.sharedpref.getString("id")!, favItemId);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.snackbar("Alert", "added To Favorite");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFromFavorite(String favItemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var respons = await favoriteData.removeFavorite(
        myServices.sharedpref.getString("id")!, favItemId);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        Get.snackbar("Alert", "removed from Favorite");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
