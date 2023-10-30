import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class RemoteCheckForgetPasswordCode {
  Crud curd;
  RemoteCheckForgetPasswordCode(this.curd);

  postCodeData(String email, String verifiycode) async {
    var respons = await curd.postData(AppLinks.checkVerfiyCodeLink,
        {"email": email, "verifiycode": verifiycode});
    return respons.fold((l) => l, (r) => r);
  }
}
