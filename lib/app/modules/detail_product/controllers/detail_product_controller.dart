import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  RxInt quantity = 0.obs;
  late TabController tabController;

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   tabController =  TabController(vsync: this, length: 4);
  // }

  void quantityIncrement() {
    quantity = quantity + 1;
  }

  void quantityDecrement() {

    if (quantity.value != 0) {
      quantity = quantity - 1;
    } else {

    }
  }
}
