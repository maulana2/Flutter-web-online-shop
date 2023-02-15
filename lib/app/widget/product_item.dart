import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:izzat/app/modules/home/models/response_product_card.dart';
import 'package:izzat/app/routes/app_pages.dart';
import 'package:izzat/app/shared/theme.dart';
import 'package:sizer/sizer.dart';

class ProductItem extends StatelessWidget {
  ResponseProductCard productCard;
  ProductItem({Key? key, required ResponseProductCard this.productCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(3.sp),
    
      onPressed: () {
        Get.rootDelegate.toNamed(Routes.DETAIL_PRODUCT);
      },
      child: Container(
        width: 10.w,
        // height: 0.2.h,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image(
                // color: Colors.amber,
                // fit: BoxFit.fill,
                height: 30.sp,
                width: double.infinity,
                image: NetworkImage(
                  'https://lzd-img-global.slatic.net/g/p/bad1c5fddbc03cfd1593cebb05098955.png_120x120q80.jpg_.webp',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productCard.kategori.toString(),
                    style: primaryTextStyle.copyWith(
                      color: black,
                      fontSize: 2.sp,
                    ),
                  ),
                  SizedBox(
                    height: 0.6.h,
                  ),
                  Text(
                    productCard.nameItem.toString(),
                    style: primaryTextStyle.copyWith(
                      color: black,
                      fontWeight: semiBold,
                      fontSize: 2.3.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 0.6.sp,
                  ),
                  Text(
                    NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0)
                        .format(productCard.harga),
                    style: primaryTextStyle.copyWith(
                      color: blue,
                      fontWeight: semiBold,
                      fontSize: 2.5.sp,
                    ),
                  ),
                  // Row(
                  //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     RatingBar.builder(
                  //       wrapAlignment: WrapAlignment.spaceBetween,
                  //       itemSize: 2.5.sp,
                  //       initialRating: 4,
                  //       minRating: 1,
                  //       direction: Axis.horizontal,
                  //       allowHalfRating: true,
                  //       itemCount: 5,
                  //       itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  //       itemBuilder: (context, _) => Icon(
                  //         size: 10,
                  //         Icons.star,
                  //         color: Colors.amber,
                  //       ),
                  //       onRatingUpdate: (rating) {
                  //         print(rating);
                  //       },
                  //     ),
                  //     Text('(49)'),
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
