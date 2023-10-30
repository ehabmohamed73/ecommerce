import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/functions/handledata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/orderspending_data.dart';
import 'package:ecommerceapp/data/model/ordersmodle.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<OrdersModle> orders = [];
  List<OrdersModle> delivered = [];
  var delev = false.obs;
  @override
  onInit() {
    getOrdersItem();
    super.onInit();
  }

  getOrdersItem() async {
    orders.clear();
    delivered.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons = await ordersPendingData
        .getOrdersData(myServices.sharedpref.getString("id")!);
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List resposData = respons["data"];
        orders.addAll(resposData.map((e) => OrdersModle.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  sortOrders() async {
    statusRequest = StatusRequest.loading;
    orders.sort((a, b) => a.ordersDate!.compareTo(b.ordersDate!));
    update();
  }

  filterOrders() {
    orders = orders.where((element) => element.ordersStatus == "1").toList();
    update();
  }

  goToOrderDetials() {
    Get.toNamed(AppRoots.orderdetials);
  }
}
