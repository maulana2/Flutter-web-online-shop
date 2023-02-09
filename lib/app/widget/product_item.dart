import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:izzat/app/routes/app_pages.dart';
import 'package:izzat/app/shared/theme.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Get.rootDelegate.toNamed(Routes.DETAIL_PRODUCT);
      },
      child: Container(
        width: 215,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Container(
                child: Image(
                  height: 180,
                  width: double.infinity,
                  image: NetworkImage(
                    'https://lzd-img-global.slatic.net/g/p/bad1c5fddbc03cfd1593cebb05098955.png_120x120q80.jpg_.webp',
                  ),
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
                    'Kosmetik',
                    style: primaryTextStyle.copyWith(
                      color: black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'IZZAT STORE Tutup Botol Spray 100ml',
                    style: primaryTextStyle.copyWith(
                      color: black,
                      fontWeight: semiBold,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Rp. 143.000',
                    style: primaryTextStyle.copyWith(
                      color: blue,
                      fontWeight: semiBold,
                      fontSize: 14,
                    ),
                  ),
                  Row(
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
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
