import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

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
              CustomWidgets.textField(
                  title: 'Nomor telepon',
                  hintText: 'Silahkan masukan nomor telepon anda'),
              CustomWidgets.textField(
                  isPassword: true,
                  title: 'Kata sandi',
                  hintText: 'Silahkan masukan kata sandi anda'),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'Pilih jenis kelamin',
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          color: black,
                        ),
                      ),
                      value: controller.dropdownvalue?.value,
                      items: controller.items
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.toString()),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        controller.dropdownvalue?.value = value.toString();
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            CustomWidgets.button(
              buttonColor: blue,
              title: 'Daftar',
              textColor: white,
              onTap: () {
                Get.rootDelegate.offAndToNamed(Routes.HOME);
              },
              width: 180,
              borderRadius: 8,
            ),
          ],
        ),
      ],
    ),
  );
}
