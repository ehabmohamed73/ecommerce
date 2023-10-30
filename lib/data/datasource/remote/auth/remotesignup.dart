import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class RemoteSignUp {
  Crud curd;
  RemoteSignUp(this.curd);

  postSignupData(
      String username, String email, String password, String phone) async {
    var respons = await curd.postData(AppLinks.signUpLink, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
