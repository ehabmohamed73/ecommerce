import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class RemoteCheckEmail {
  Crud curd;
  RemoteCheckEmail(this.curd);

  postEmailData(String email) async {
    var respons =
        await curd.postData(AppLinks.checkEmailLink, {"email": email});
    return respons.fold((l) => l, (r) => r);
  }
}
