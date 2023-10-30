import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class HomeData {
  Crud curd;
  HomeData(this.curd);

  getData() async {
    var respons = await curd.postData(AppLinks.homepageLink, {});
    return respons.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var respons = await curd.postData(AppLinks.searchLink, {"search": search});
    return respons.fold((l) => l, (r) => r);
  }
}
