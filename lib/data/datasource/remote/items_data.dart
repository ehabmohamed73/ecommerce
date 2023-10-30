import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class ItemsData {
  Crud curd;

  ItemsData(this.curd);

  getData(String catId, String userId) async {
    var respons = await curd
        .postData(AppLinks.itemsLink, {"id": catId, "userId": userId});
    return respons.fold((l) => l, (r) => r);
  }
}
