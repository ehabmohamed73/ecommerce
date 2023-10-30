import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class RemoteRestPassword {
  Crud curd;
  RemoteRestPassword(this.curd);

  postPasswordData(String email, String password) async {
    var respons = await curd.postData(
        AppLinks.resetpasswordCodeLink, {"email": email, "password": password});
    return respons.fold((l) => l, (r) => r);
  }
}
