import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:izzat/app/routes/app_pages.dart';
import 'package:izzat/app/routes/auto_routes.dart';
import 'package:izzat/app/shared/theme.dart';
import 'package:izzat/app/widget/custom_widget.dart';
import 'package:izzat/app/widget/search_widget.dart';
import 'package:sizer/sizer.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          CustomWidgets.appBar(),
          Expanded(
            child: Container(
              color: strokeGrey,
              child: ListView(
                children: [
                  _welcomeText(context),
                  _loginView(controller, context),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            color: white,
            child: Center(
              child: Text(
                '@Izzat 2023',
                style: primaryTextStyle.copyWith(fontSize: 13, color: black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: defaultMargin2),
    padding: EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Selamat datang di Izzat store! Silahkan login.',
          style: primaryTextStyle.copyWith(
            overflow: TextOverflow.ellipsis,
            fontSize: 15,
            fontWeight: semiBold,
          ),
        ),
        Row(
          children: [
            Text(
              'Member baru? Daftar disini',
              style: primaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: normal,
                color: textInactive,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.rootDelegate.toNamed(Routes.DAFTAR);
              },
              child: Text(
                'Daftar',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: normal,
                  color: blue,
                ),
              ),
            ),
            Text(
              'disini',
              style: primaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: normal,
                color: textInactive,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _loginView(LoginController controller, context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => controller.code != 0
                  ? Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: red,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/error-icon.png',
                            height: 30,
                            width: 30,
                            color: white,
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                'Terjadi Kesalahan ${controller.value} ',
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
                  : SizedBox()),
              CustomWidgets.textField(
                  textController: controller.usernameC,
                  title: 'Nomor telepon atau email',
                  hintText: 'Silahkan masukan nomor telepon atau email anda'),
              CustomWidgets.textField(
                  textController: controller.passC,
                  isPassword: true,
                  title: 'Kata sandi',
                  hintText: 'Silahkan masukan kata sandi anda'),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // AutoRoute.of(context).push(HomeView());
                    },
                    child: Text('Lupa password?'),
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
              title: 'Login',
              textColor: white,
              onTap: () async {
                controller.login(context);
                // Get.rootDelegate.offAndToNamed(Routes.HOME);
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
