import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      if (await checkInternet()) {
        var respons = await http.post(Uri.parse(url), body: data);
        if (respons.statusCode == 200 || respons.statusCode == 201) {
          Map responsBody = jsonDecode(respons.body);
          print(responsBody);
          return Right(responsBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
