import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:izzat/app/routes/app_pages.dart';
import 'package:izzat/app/shared/theme.dart';
import 'package:izzat/app/widget/search_widget.dart';

class CustomWidgets {
  static Widget textField({
    bool isPassword = false,
    bool isNumber = false,
    TextEditingController? textController,
    required String title,
    required String hintText,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            height: 40,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: greyButton, width: 1),
              color: white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: isPassword == true
                          ? TextInputType.text
                          : TextInputType.emailAddress,
                      controller: textController,
                      obscureText: isPassword == true ? true : false,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: hintText,
                        hintStyle: secondaryTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // static Widget tileProfile(
  //     {required String title, required VoidCallback onPressed}) {
  //   return Container(
  //     margin: EdgeInsets.only(
  //       top: 20,
  //     ),
  //     child: MaterialButton(
  //       onPressed: onPressed,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             title,
  //             style: primaryTextStyle.copyWith(
  //               fontSize: 13,
  //               color: secondaryTextColor,
  //             ),
  //           ),
  //           Icon(
  //             Icons.arrow_forward_ios_rounded,
  //             color: secondaryTextColor,
  //             size: 12,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  static Widget button({
    required Color buttonColor,
    required String title,
    required Color textColor,
    required VoidCallback onTap,
    required double width,
    required double borderRadius,
    /* required Function onButtonPressed */
  }) {
    return Container(
      margin:
          EdgeInsets.only(top: 30, right: defaultMargin, left: defaultMargin),
      height: 50,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: secondaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 16,
            color: textColor,
          ),
        ),
      ),
    );
  }

  static Widget appBar() {
    return Container(
      height: heighAppbar,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: Row(
        children: [
          MaterialButton(
            onPressed: () => Get.rootDelegate.toNamed(Routes.HOME),
            child: Image.asset(
              'assets/images/izzat-logo.png',
              height: 100,
              width: 100,
            ),
          ),
          Expanded(
            child: SearchWidget(
                text: 'Cari di Izzat store',
                onChanged: (value) {},
                hintText: 'Cari di Izzat store'),
          ),
          MaterialButton(
            onPressed: () => Get.rootDelegate.toNamed(Routes.CART),
            child: Image.asset(
              'assets/images/cart-icon.png',
              height: 100,
              width: 50,
              color: black,
            ),
          ),
          MaterialButton(
            onPressed: () => Get.rootDelegate.toNamed(Routes.PROFILE),
            child: Image.asset(
              'assets/images/profile-icon.png',
              height: 100,
              width: 50,
              color: black,
            ),
          ),
        ],
      ),
    );
  }

  static Widget rating() {
    return Row(
      children: [
        RatingBar.builder(
          itemSize: 20,
          initialRating: 4,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            size: 10,
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        Text('(49)'),
      ],
    );
  }

  static SnackBar snackBar() {
    return SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,

      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        inMaterialBanner: true,
        title: 'On Snap!',
        message:
            'This is an example error message that will be shown in the body of snackbar!',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );
    ;
  }
}
