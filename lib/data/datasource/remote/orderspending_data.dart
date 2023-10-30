import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class OrdersPendingData {
  Crud curd;
  OrdersPendingData(this.curd);

  getOrdersData(String userId) async {
    var respons =
        await curd.postData(AppLinks.ordersPending, {"userId": userId});
    return respons.fold((l) => l, (r) => r);
  }
}
