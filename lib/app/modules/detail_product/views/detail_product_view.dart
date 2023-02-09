import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:izzat/app/routes/app_pages.dart';
import 'package:izzat/app/shared/theme.dart';
import 'package:izzat/app/widget/custom_widget.dart';
import 'package:izzat/app/widget/product_item.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
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
                  _product(),
                  _productTerkait(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _productTerkait() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Produk Terkait',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              color: black,
              fontWeight: semiBold,
            ),
          ),
          Divider(),
          allCatItem(),
        ],
      ),
    );
  }

  Container _product() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 450,
                width: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgy1JIb5upIfY0TBbBYkZvAUqivnS5XNsK-g&usqp=CAU',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                width: 600,
                height: 100,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgy1JIb5upIfY0TBbBYkZvAUqivnS5XNsK-g&usqp=CAU',
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 450,
            width: 600,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alat makeup',
                    style: primaryTextStyle.copyWith(
                      fontSize: 25,
                      fontWeight: semiBold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomWidgets.rating(),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                      'Rp. 106.000',
                      style: primaryTextStyle.copyWith(
                        fontSize: 30,
                        color: blue,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity :',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    controller.quantityDecrement();
                                  },
                                  child: Text('-'),
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Obx(
                                      () => Text(
                                        '${controller.quantity.value}',
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    )),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.quantityIncrement();
                                  },
                                  child: Text('+'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Obx(
                      () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.quantity.value == 0
                              ? textInactive
                              : blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (controller.quantity.value == 0) {
                            print('add dulu bro');
                          } else {
                            Get.rootDelegate.toNamed(Routes.CART);
                          }
                          ;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            '+ TAMBAH KE KERANJANG',
                          ),
                        ),
                      ),
                    ),
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: TabBar(
                                unselectedLabelStyle: primaryTextStyle.copyWith(
                                  fontSize: 15,
                                  color: textInactive,
                                ),
                                labelStyle: primaryTextStyle.copyWith(
                                  fontSize: 15,
                                  color: black,
                                  fontWeight: semiBold,
                                ),
                                indicatorColor: blue,
                                labelColor: black,
                                unselectedLabelColor: textInactive,
                                // ignore: prefer_const_literals_to_create_immutables
                                tabs: [
                                  const Tab(
                                    text: 'Deskripsi',
                                  ),
                                  const Tab(
                                    text: 'Informasi Tambahan',
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Text('Deskripsi product'),
                                ),
                                Text('informsi tambahan'),
                              ],
                            ),
                          ),
                        ],
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
}

MasonryGridView allCatItem() {
  return MasonryGridView.count(
    padding: EdgeInsets.all(20),
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    crossAxisCount: 5,
    addAutomaticKeepAlives: false,
    itemCount: 20,
    itemBuilder: (context, index) {
      return ProductItem();
    },
  );
}
