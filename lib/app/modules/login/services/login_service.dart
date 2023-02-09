import 'dart:convert';
import 'dart:io';

import 'package:izzat/app/modules/models/api_return_value.dart';
import 'package:izzat/app/shared/const.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<ApiReturnValue> requestLogin({username, password}) async {
    var url = Uri.parse("${baseUrl + api + v1 + login}");
    print('service jalan');
    var header = {"Content-Type": "application/json; charset=utf-8"};
    var body = jsonEncode({'username': username, 'password': password});
    try {
      var response = await http.post(url, body: body, headers: header);
      var statusCode = response.statusCode;
      print('service : $statusCode');
      print('services : ${response.body}');
      try {
        var hasil = jsonDecode(response.body);

        // Check if status code 404 / 200 / 5xx
        switch (statusCode) {
          case 404:
            var error = hasil['message'];
            String errorMsg =
                error.reduce((value, elment) => value + ',' + ' ' + elment);
            return ApiReturnValue(code: statusCode, message: errorMsg);
          case 200:
            print('masuk 200');

            // List<Pelajaran> listPelajaran =
            //     Pelajaran.fromJsonList(result['pelajaran']);
            var token = hasil['token'];
            return ApiReturnValue(
              code: statusCode,
              value: token,
            );
          default:
            return ApiReturnValue(
                code: statusCode, message: 'Error Server : $statusCode');
        }
      } catch (e) {
        return ApiReturnValue(code: statusCode, message: 'Error : $statusCode');
      }
    } on SocketException catch (e) {
      return ApiReturnValue(
          code: 00, message: 'Tidak terhubung ke jaringan ($e)');
    }
    // try {
    //   var response = await http.post(url, body: body);
    //   response.statusCode;
    //   var stCode = response.statusCode;
    //   print('body: ${response.body}');
    //   var result = jsonDecode(response.body);
    //   print('ini status code : ${response.statusCode}');
    //   if (stCode == 200) {
    //     print('masuk 200');
    //     return ApiReturnValue(
    //       code: stCode,
    //       value: result['token'],
    //     );
    //   } else {
    //     return ApiReturnValue(
    //       code: stCode,
    //       value: result['message'],
    //     );
    //   }
    // } catch (e) {
    //   print('masuk sini');
    //   return ApiReturnValue(
    //     code: 00,
    //     value: 'Terjadi kesalahan ${e}',
    //   );
    // }
  }
}
