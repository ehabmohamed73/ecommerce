import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class TestData {
  Crud curd;
  TestData(this.curd);

  getData() async {
    var respons = await curd.postData(AppLinks.test, {});
    return respons.fold((l) => l, (r) => r);
  }
}
