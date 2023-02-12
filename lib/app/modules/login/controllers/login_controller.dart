import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izzat/app/modules/login/services/login_service.dart';
import 'package:izzat/app/modules/models/api_return_value.dart';
import 'package:izzat/app/routes/app_pages.dart';
import 'package:izzat/app/routes/auto_routes.dart';
import 'package:izzat/app/shared/auth_prefs.dart';
import 'package:izzat/app/widget/custom_widget.dart';
import 'package:izzat/app/widget/snackbar.dart';

class LoginController extends GetxController {
  TextEditingController usernameC = TextEditingController();
  TextEditingController passC = TextEditingController();
  RxInt? code = 0.obs;
  var isUserPassEmpty = false.obs;
  RxBool isLoading = false.obs;

  late Rx value = ''.obs;
  //TODO: Implement LoginController

  Future login(context) async {
    print(isUserPassEmpty);
    if (usernameC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      isUserPassEmpty.value = false;
      ApiReturnValue result = await LoginService().requestLogin(
        username: usernameC.text,
        password: passC.text,
      );
      var stCode = result.code;
      // print('controller :${result.value}');
      print('controller : $stCode');
      switch (stCode) {
        case 200:
          AuthPrefs.setToken(result.value);
          Get.rootDelegate.toNamed(Routes.HOME);
          isLoading.value = false;
          value = 'Berhasil Login'.obs;

          break;
        default:
          print('masuk default');
          code!.value = stCode!;
          value.value = result.value;
          isLoading.value = false;
          print('masuk default: ${isLoading}');

        // ScaffoldMessenger.of(context)
        //   ..hideCurrentSnackBar()
        //   ..showSnackBar(CustomWidgets.snackBar());
      }
    } else {
      print('else run');
      // kalau username dan password null
      isLoading.value = false;
      isUserPassEmpty.value = true;
    }

    print('ini isloading $isLoading');
    update();
  }
}
