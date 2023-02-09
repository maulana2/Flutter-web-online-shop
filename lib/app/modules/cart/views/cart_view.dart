import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:izzat/app/shared/theme.dart';
import 'package:izzat/app/widget/custom_widget.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          CustomWidgets.appBar(),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              color: strokeGrey,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 25, top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //product
                              Column(
                                children: [
                                  Text(
                                    'Product',
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 13, fontWeight: semiBold),
                                  ),
                                  Container(
                                    height: 80,
                                    margin: EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        Image(
                                          width: 80,
                                          image: NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgy1JIb5upIfY0TBbBYkZvAUqivnS5XNsK-g&usqp=CAU'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Alat Makeup',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: semiBold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Harga',
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 13, fontWeight: semiBold),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 80,
                                    child: Center(
                                      child: Text(
                                        'Rp. 149.000',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Quantitas',
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 13, fontWeight: semiBold),
                                  ),
                                  Container(
                                    height: 80,
                                    margin: EdgeInsets.only(top: 20),
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                // controller.quantityIncrement();
                                              },
                                              child: Text('-'),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Text(
                                                '0',
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: semiBold,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                // controller.quantityIncrement();
                                              },
                                              child: Text('+'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 13, fontWeight: semiBold),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 80,
                                    child: Center(
                                      child: Text(
                                        'Rp. 149.000',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 25,
                        ),
                        padding: EdgeInsets.all(
                          15,
                        ),
                        width: 350,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(
                              10,
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total pesanan',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Subtotal',
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                      Text(
                                        'Rp. 149.000',
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: semiBold,
                                          color: blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Text(
                                    'Masukan Alamat',
                                    style: primaryTextStyle.copyWith(),
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                      Text(
                                        'Rp. 149.000',
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: semiBold,
                                          color: blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                top: 20,
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Bayar'),
                                    Icon(
                                      Icons.arrow_forward_outlined,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
