import 'package:get/get.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/data/datasource/remote/test_data.dart';

import '../core/functions/handledata.dart';

class TestController extends GetxController {
  TestData testdata = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  contrllGetData() async {
    statusRequest = StatusRequest.loading;
    var respons = await testdata.getData();
    print("========================== controller $respons ");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        data.addAll(respons['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    contrllGetData();
    super.onInit();
  }
}
