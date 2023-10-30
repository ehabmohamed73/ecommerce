import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class CheckOutData {
  Crud curd;
  CheckOutData(this.curd);

  getCheckOutData(Map data) async {
    var respons = await curd.postData(AppLinks.checkout, data);
    return respons.fold((l) => l, (r) => r);
  }
}
