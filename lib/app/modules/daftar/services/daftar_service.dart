import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:izzat/app/modules/models/api_return_value.dart';

import 'package:izzat/app/shared/const.dart';

class DaftarService {
  Future requestDaftar({var email, var name, var role}) async {
    var url = Uri.parse("${baseUrl + api + v1 + daftar}");
    print('service jalan');
    var header = {"Content-Type": "application/json; charset=utf-8"};
    var body = jsonEncode({
      "email": email,
      "name": name,
      "role": [role]
    });
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
            print('service error msg : $errorMsg');
            return ApiReturnValue(code: statusCode, value: errorMsg);
          case 200:
            print('masuk 200');

            // List<Pelajaran> listPelajaran =
            //     Pelajaran.fromJsonList(result['pelajaran']);
            var message = hasil['message'];
            return ApiReturnValue(
              code: statusCode,
              value: message,
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
