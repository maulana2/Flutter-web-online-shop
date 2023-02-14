import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:izzat/app/modules/home/models/response_carousel.dart';
import 'package:izzat/app/shared/const.dart';

import '../models/api_return_value.dart';

class HomeServices {
  Future getCaraousel() async {
    var url = Uri.parse("${baseUrl + api + v1 + carousel}");
    var header = {"Content-Type": "application/json; charset=utf-8"};
    var body = jsonEncode({
      'token': 'token1',
    });
    try {
      var response = await http
          .post(url, body: body, headers: header)
          .timeout(const Duration(seconds: 5));

      var statusCode = response.statusCode;
      try {
        print('ini status code : ${statusCode}');
        var _hasil = jsonDecode(response.body);

        // Check if status code 404 / 200 / 5xx
        switch (statusCode) {
          case 404:
            var error = _hasil['message'];
            String errorMsg =
                error.reduce((value, elment) => value + ',' + ' ' + elment);
            return ApiReturnValue(value: errorMsg, code: statusCode);

          case 200:
            List<ResponseCarousel> listCarousel =
                ResponseCarousel.fromJsonList(_hasil['images']);
            print('services : ${listCarousel.length}');
            return ApiReturnValue(
              code: statusCode,
              value: listCarousel,
            );

          default:
            return ApiReturnValue(
                code: statusCode, message: 'Error : $statusCode');
        }
      } catch (e) {
        return ApiReturnValue(code: statusCode, message: 'Error : $statusCode');
      }
    } on SocketException catch (e) {
      return ApiReturnValue(
          code: 00, message: 'Tidak terhubung ke jaringan ($e)');
    } on TimeoutException catch (e) {
      return ApiReturnValue(
          code: 00, message: 'Tidak terhubung ke jaringan ($e)');
    }
  }
}
