import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/favorite_data.dart';
import 'package:ecommerceapp/data/model/myfavorite.dart';
import 'package:get/get.dart';

class MyFavoriteContrroler extends GetxController {
  List<MyFavoriteModel> favData = [];
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  FavoriteData favoriteData = FavoriteData(Get.find());

  viewFromFavorite() async {
    favData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons =
        await favoriteData.viewFavorite(myServices.sharedpref.getString("id")!);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List responsList = respons['data'];
        favData.addAll(responsList.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFromFavorite(String favId) {
    var respons = favoriteData.removeFromFavorite(favId);
    favData.removeWhere((element) => element.favoriteId == favId);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    viewFromFavorite();
    super.onInit();
  }
}
