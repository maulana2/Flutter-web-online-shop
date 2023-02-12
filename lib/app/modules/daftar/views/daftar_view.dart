import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:izzat/app/routes/app_pages.dart';
import 'package:izzat/app/shared/theme.dart';
import 'package:izzat/app/widget/custom_widget.dart';

import '../controllers/daftar_controller.dart';

class DaftarView extends GetView<DaftarController> {
  DaftarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomWidgets.appBar(),
          Expanded(
            child: Container(
              color: strokeGrey,
              child: ListView(
                children: [
                  _createdAccText(context),
                  _createdAccView(controller),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _createdAccText(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: defaultMargin2),
    padding: EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Buat akun Izzat Store Andn',
          style: primaryTextStyle.copyWith(
            overflow: TextOverflow.ellipsis,
            fontSize: 15,
            fontWeight: semiBold,
          ),
        ),
        Row(
          children: [
            Text(
              'Sudah punya akun Lazada? Login di sini',
              style: primaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: normal,
                color: textInactive,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.rootDelegate.toNamed(Routes.LOGIN);
              },
              child: Text(
                'Login',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: normal,
                  color: blue,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _createdAccView(DaftarController controller) {
  return Container(
    padding: EdgeInsets.all(25),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: white,
    ),
    margin:
        EdgeInsets.only(left: defaultMargin2, right: defaultMargin2, top: 25),
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Obx(
                () => controller.code!.value != 0
                    ? controller.code!.value == 200
                        ? Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: green,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      '${controller.value}',
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 12,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: red,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/error-icon.png',
                                  height: 25,
                                  width: 25,
                                  color: white,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      'Terjadi Kesalahan',
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 12,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                    : SizedBox(),
              ),
              Obx(
                () => controller.isEmailandNameEmpty.value == false
                    ? SizedBox()
                    : Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: red,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/error-icon.png',
                              height: 25,
                              width: 25,
                              color: white,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  'Email, name, dan jenis kelamin tidak boleh kosong',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 12,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              CustomWidgets.textField(
                textController: controller.emailC,
                title: 'Email',
                hintText: 'Silahkan masukan email anda',
              ),
              CustomWidgets.textField(
                textController: controller.nameC,
                title: 'Nama',
                hintText: 'Silahkan masukan nama anda',
              ),

              // CustomWidgets.textField(
              //     isPassword: true,
              //     title: 'Kata sandi',
              //     hintText: 'Silahkan masukan kata sandi anda'),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButtonHideUnderline(
                      child: Obx(
                    () => DropdownButton2(
                      hint: Text(
                        controller.dropdownvalue.value,
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          color: black,
                        ),
                      ),
                      items: controller.items
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.toString()),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        controller.dropdownvalue.value = value.toString();
                      },
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            Obx(
              () => CustomWidgets.button(
                buttonColor: controller.isLoading == true ? greyButton : blue,
                title: controller.isLoading == true ? 'Loading..' : 'Daftar',
              textColor: white,
              onTap: () {
                  if (controller.isLoading == false) {
                    controller.daftarRequest();
                  } else {}
                  // Get.rootDelegate.offAndToNamed(Routes.HOME);
              },
              width: 180,
              borderRadius: 8,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
