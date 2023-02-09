import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:izzat/app/routes/app_pages.dart';
import 'package:izzat/app/shared/theme.dart';
import 'package:izzat/app/widget/custom_widget.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            CustomWidgets.appBar(),
            Container(
              child: Text(
                'Akun Saya',
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  color: black,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      25,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: strokeGrey,
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Halo maulana.malik53, bukan maulana.malik53?',
                              style: primaryTextStyle.copyWith(
                                fontSize: 13,
                                color: black,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.rootDelegate.toNamed(Routes.LOGIN);
                                },
                                child: Text(
                                  'Keluar',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 13,
                                    color: blue,
                                    fontWeight: semiBold,
                                  ),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            itemProfile(title: 'Alamat'),
                            itemProfile(title: 'Akun'),
                            itemProfile(title: 'Keluar'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Container itemProfile({required String title}) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
        left: 15,
      ),
      height: 180,
      width: 180,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(
            12,
          )),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          height: 100,
          width: 100,
          child: Image.asset('assets/images/maps.png'),
        ),
        Text(
          title,
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
      ]),
    );
  }
}
