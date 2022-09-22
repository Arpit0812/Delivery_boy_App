import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyReviewScreen extends StatefulWidget {
  MyReviewScreen({Key? key}) : super(key: key);

  @override
  State<MyReviewScreen> createState() => _MyReviewScreenState();
}

class _MyReviewScreenState extends State<MyReviewScreen> {
  bool isStar = false;

  StarController starController = Get.put(StarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: () {
              Get.back();
            }),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Silver Leaf Vegetables',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.h,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 5.h),
            Row(
              children: [
                Obx(
                  () => InkWell(
                    onTap: () {
                      starController.isStarIcon();
                      print(isStar);
                    },
                    child: starController.isStar.value
                        ? Icon(
                            Icons.star,
                            color: Colors.green,
                          )
                        : Icon(Icons.star_border, color: Colors.green),
                  ),
                ),
                Text(
                  '4.2',
                  style: TextStyle(color: Colors.green, fontSize: 15.h),
                ),
                SizedBox(width: 5.w),
                Text(
                  '148 Reviews',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.h),
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'George Timber',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Obx(
                              () => InkWell(
                                onTap: () {
                                  starController.isStarIcon();
                                  print(isStar);
                                },
                                child: starController.isStar.value
                                    ? Icon(
                                        Icons.star,
                                        color: Colors.green,
                                      )
                                    : Icon(Icons.star_border,
                                        color: Colors.green),
                              ),
                            ),
                            Text(
                              '4.2',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 15.h),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          textAlign: TextAlign.justify,
                          'Every individuals needs good foods for a healthy body . We have to take good food in a balanced ratio . Such as, fruits , green vegetables,pulse,and so on',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.h,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class StarController extends GetxController {
  RxBool isStar = false.obs;

  void isStarIcon() {
    isStar.value = !isStar.value;
  }
}
