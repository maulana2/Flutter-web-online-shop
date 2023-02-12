import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:izzat/app/modules/daftar/services/daftar_service.dart';
import 'package:izzat/app/routes/app_pages.dart';

import '../../models/api_return_value.dart';

class DaftarController extends GetxController {
  //TODO: Implement DaftarController

  final count = 0.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  var jenisKelamin;
  var items = [
    'Laki - laki',
    'Perempuan',
  ].obs;
  RxString dropdownvalue = 'Pilih jenis kelamin'.obs;
  RxBool isLoading = false.obs;
  RxBool isEmailandNameEmpty = false.obs;
  RxInt? code = 0.obs;
  late Rx value = ''.obs;

  Future daftarRequest() async {
    if (emailC.text.isNotEmpty &&
        nameC.text.isNotEmpty &&
        dropdownvalue.value != 'Pilih jenis kelamin') {
      isLoading.value = true;
      isEmailandNameEmpty.value = false;
      ApiReturnValue result = await DaftarService()
          .requestDaftar(email: emailC.text, name: nameC.text, role: 'user');
      var stCode = result.code;
      // print('controller :${result.value}');
      print('controller : $stCode');
      switch (stCode) {
        case 200:
          // AuthPrefs.setToken(result.value);
          // Get.rootDelegate.toNamed(Routes.LOGIN);
          code!.value = stCode!;
          isLoading.value = false;
          value.value = result.value;
          emailC.text = '';
          nameC.text = '';
          dropdownvalue.value = 'Pilih jenis kelamin';

          break;
        default:
          print('masuk default');
          isLoading.value = false;
          code!.value = stCode!;
          value.value = result.value;
          print('masuk default: ${isLoading}');

        // ScaffoldMessenger.of(context)
        //   ..hideCurrentSnackBar()
        //   ..showSnackBar(CustomWidgets.snackBar());
      }
    } else {
      print('else run');
      // kalau username dan password null
      isLoading.value = false;
      isEmailandNameEmpty.value = true;
    }

    print('ini isloading $isLoading');
    update();
  }
}
