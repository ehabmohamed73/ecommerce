import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class CartData {
  Crud curd;
  CartData(this.curd);

  addCart(String cartUserId, String cartItemId) async {
    var respons = await curd.postData(
        AppLinks.addCart, {"userId": cartUserId, "itemId": cartItemId});
    return respons.fold((l) => l, (r) => r);
  }

  removeCart(String cartUserId, String cartItemId) async {
    var respons = await curd.postData(
        AppLinks.removeCart, {"userId": cartUserId, "itemId": cartItemId});
    return respons.fold((l) => l, (r) => r);
  }

  itemCount(String cartUserId, String cartItemId) async {
    var respons = await curd.postData(
        AppLinks.itemCount, {"userId": cartUserId, "itemId": cartItemId});
    return respons.fold((l) => l, (r) => r);
  }

  viewCart(String cartUserId) async {
    var respons =
        await curd.postData(AppLinks.viewCart, {"userId": cartUserId});
    return respons.fold((l) => l, (r) => r);
  }

  checkCouponData(String couponName) async {
    var respons =
        await curd.postData(AppLinks.checkCoupon, {"couponName": couponName});
    return respons.fold((l) => l, (r) => r);
  }
}
