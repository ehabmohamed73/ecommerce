import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class RemoteCheckcode {
  Crud curd;
  RemoteCheckcode(this.curd);

  postCodeData(String email, String verifiycode) async {
    var respons = await curd.postData(
        AppLinks.checkCodeLink, {"email": email, "verifiycode": verifiycode});
    return respons.fold((l) => l, (r) => r);
  }

  resendCodeData(String email) async {
    var respons = await curd.postData(AppLinks.resendcode, {"email": email});
    return respons.fold((l) => l, (r) => r);
  }
}
