import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:izzat/app/routes/app_pages.dart';
import 'package:izzat/app/shared/theme.dart';
import 'package:izzat/app/widget/custom_widget.dart';
import 'package:izzat/app/widget/product_item.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            CustomWidgets.appBar(),
            Expanded(
                child: ListView(
              children: [
                bannerItem(context),
                _kategori(),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  color: strokeGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      popularItemText(),
                      popularItem(),
                    ],
                  ),
                ),

                _informasiItem(),
                //semua product
                // Container(
                //   padding: EdgeInsets.symmetric(vertical: 25),

                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       allCatItemText(),
                //       allCatItem(),
                //     ],
                //   ),
                // ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: 25,
                  ),
                  width: double.infinity,
                  color: primaryLogo,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Izzat Store',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              color: white,
                              fontWeight: semiBold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Copyright © 2021 Izzat Store',
                            style: primaryTextStyle.copyWith(
                              fontSize: 11,
                              color: white,
                            ),
                          ),
                          Text(
                            'All rights reserved.',
                            style: primaryTextStyle.copyWith(
                              fontSize: 11,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: 5,
                            ),
                            child: Image.asset(
                              'assets/images/facebook.png',
                              height: 25,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: 5,
                            ),
                            child: Image.asset(
                              'assets/images/facebook.png',
                              height: 25,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: 5,
                            ),
                            child: Image.asset(
                              'assets/images/facebook.png',
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ],
        ));
  }

  Container _informasiItem() {
    return Container(
      padding: EdgeInsets.only(
        top: 25,
        bottom: 25,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      color: white,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: semiBold,
                      color: black,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Hubungi kami',
                    style: primaryTextStyle.copyWith(
                      fontSize: 11,
                      color: black,
                    ),
                  ),
                  Text(
                    'Kebijakan Privas',
                    style: primaryTextStyle.copyWith(
                      fontSize: 11,
                      color: black,
                    ),
                  ),
                  Text(
                    'Syarat & Ketentuan',
                    style: primaryTextStyle.copyWith(
                      fontSize: 11,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Metode Pembayaran',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: semiBold,
                      color: black,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transfer Bank (Virtual Account)',
                          style: primaryTextStyle.copyWith(
                            fontSize: 11,
                            color: black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/bank.png',
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/bank.png',
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/bank.png',
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'E-Wallet',
                          style: primaryTextStyle.copyWith(
                            fontSize: 11,
                            color: black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/ewallet-shoppe.png',
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/ewallet-shoppe.png',
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Kartu Kredit',
                    style: primaryTextStyle.copyWith(
                      fontSize: 11,
                      color: black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/bank.png',
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/bank.png',
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/bank.png',
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Layanan Pelanggan',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: semiBold,
                      color: black,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'cs@izzastore.com',
                    style: primaryTextStyle.copyWith(
                      fontSize: 11,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _kategori() {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: 25,
      ),
      color: bgColor,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 50,
            ),
            child: Text(
              'Kategori',
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                color: black,
                fontWeight: semiBold,
              ),
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.rootDelegate.toNamed(Routes.KATEGORI);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                          'https://i.ibb.co/4TDDVTp/kategori.png',
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    margin: EdgeInsets.only(right: 25),
                    height: 50,
                    width: 200,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  MasonryGridView allCatItem() {
    return MasonryGridView.count(
      padding: EdgeInsets.all(20),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 6,
      addAutomaticKeepAlives: false,
      itemCount: 20,
      itemBuilder: (context, index) {
        return ProductItem();
      },
    );
  }

  Container popularItemText() {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: 20,
      ),
      child: Text(
        'Popular Item',
        style: primaryTextStyle.copyWith(
          fontSize: 15,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Container allCatItemText() {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: 20,
      ),
      child: Text(
        'Popular Item',
        style: primaryTextStyle.copyWith(
          fontSize: 15,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Container popularItem() {
    return Container(
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, top: 20, bottom: 20),
      height: 320,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) => ProductItem(),
      ),
    );
  }

  Container bannerItem(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.5,
      child: CarouselSlider(
        items: [cardBanner()],
        options: CarouselOptions(
          animateToClosest: true,
          autoPlay: true,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            // homeProv.currentCarousel = index;
          },
        ),
      ),
    );
  }
}

Widget cardBanner() {
  return GestureDetector(
    onTap: () {
      // Navigator.pushNamed(context, Routes.webviewPage,
      //     arguments: WebViewPage(
      //       url: url,
      //     ));
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://lzd-img-global.slatic.net/g/shop/efebb632f5271f3f44ee9ad74c3df90d.jpg_2200x2200q80.jpg_.webp'),
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 3,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              ),
            ]),
      ),
    ),
  );
}
