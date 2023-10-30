import 'package:ecommerceapp/core/classes/statusrequest.dart';

handlingData(respons) {
  if (respons is StatusRequest) {
    return respons;
  } else {
    return StatusRequest.success;
  }
}
