import 'package:delivery_boy_app/views/my_product_screen.dart';
import 'package:delivery_boy_app/views/order_screen.dart';
import 'package:delivery_boy_app/views/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../common_text.dart';
import '../controller/bottom_controller.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build done');
    BottomController bottomController = Get.put(BottomController());

    List bottomItem = [
      {'icon': Icons.shopping_bag_outlined, 'name': 'My Order'},
      {'icon': Icons.crop_square, 'name': 'My Product'},
      {'icon': Icons.person_outline_outlined, 'name': 'My Account'},
    ];
    List pages = [
      OrderScreen(),
      MyProductScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomItem.length,
            (index) => GestureDetector(
              onTap: () {
                bottomController.selectItem(index);
              },
              child: Expanded(
                child: Obx(
                  () => Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: bottomController.selectedPage.value == index
                          ? Colors.yellow.shade100
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            bottomItem[index]['icon'],
                            size: 25,
                            color: bottomController.selectedPage.value == index
                                ? Colors.blue
                                : Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Ts(
                            text: bottomController.selectedPage.value == index
                                ? bottomItem[index]['name']
                                : '',
                            size: 12,
                            weight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => pages[bottomController.selectedPage.value],
      ),
    );
  }
}
