import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class RemoteLogIn {
  Crud curd;
  RemoteLogIn(this.curd);

  postLoginData(String email, String password) async {
    var respons = await curd.postData(AppLinks.loginLink, {
      "email": email,
      "password": password,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
