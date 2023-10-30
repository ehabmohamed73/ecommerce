import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class AddressData {
  Crud curd;
  AddressData(this.curd);

  getAddressData(String userId) async {
    var respons = await curd.postData(AppLinks.viewAddress, {
      "userId": userId,
    });
    return respons.fold((l) => l, (r) => r);
  }

  addAddressData(String userId, String name, String city, String street,
      String lat, String long) async {
    var respons = await curd.postData(AppLinks.addAddress, {
      "userId": userId,
      "city": city,
      "street": street,
      "name": name,
      "lat": lat,
      "lang": long
    });
    return respons.fold((l) => l, (r) => r);
  }

  editAddressData(String addressId, String name, String city, String street,
      String lat, String long) async {
    var respons = await curd.postData(AppLinks.editAddress, {
      "addressId": addressId,
      "city": city,
      "street": street,
      "name": name,
      "lat": lat,
      "lang": long
    });
    return respons.fold((l) => l, (r) => r);
  }

  removeAddressData(String addressId) async {
    var respons = await curd.postData(AppLinks.removeAddress, {
      "addressId": addressId,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
