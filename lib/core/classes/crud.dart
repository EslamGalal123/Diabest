import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../functions/check_internet.dart';
import 'status_request.dart';
import 'package:http/http.dart' as http;

class CRUD {
  Future<Either<StatusRequest, Map>> postData(
      String linkUrl, Map<dynamic, dynamic> data) async {
    try {
      if (await checkInternet()) {

        var response = await http.post(
          Uri.parse(linkUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body:jsonEncode( data),


        );
        print(data
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);

          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.failure);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverException);
    }
  }
}
