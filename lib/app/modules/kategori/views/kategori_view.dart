import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:izzat/app/shared/theme.dart';
import 'package:izzat/app/widget/custom_widget.dart';
import 'package:sizer/sizer.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
    ];

    return Scaffold(
      body: Column(
        children: [
          CustomWidgets.appBar(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            color: strokeGrey,
            height: 8.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: strokeGrey,
                    elevation: 0,
                    foregroundColor: black,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Semua Kategori',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 2.5.sp,
                    ),
                  ),
                ),
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: GFDropdown<String>(
                      items: ['items1', 'items 2', 'items 3']
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                      value: controller.selectedValue.value,
                      onChanged: (newValue) {
                        controller.selectedValue.value = newValue.toString();
                      },
                    ),
                  ),
                ),
                Text('data'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
