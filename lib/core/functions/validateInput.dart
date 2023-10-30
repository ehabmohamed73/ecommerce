import 'package:get/get.dart';

validateInput(String value, int min, int max, String type) {
  if (value.isEmpty) {
    return "can't be empty";
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(value)) {
      return "no't valide email";
    }
  }
  if (type == 'username') {
    if (!GetUtils.isUsername(value)) {
      return "no't valide username";
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(value)) {
      return "no't valide phone number";
    }
  }
  if (value.length < min) {
    return "can't be less than $min";
  }
  if (value.length > max) {
    return "can't be large than $max";
  }
}
