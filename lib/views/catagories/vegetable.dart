import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VegetableScreen extends StatefulWidget {
  const VegetableScreen({Key? key}) : super(key: key);

  @override
  State<VegetableScreen> createState() => _VegetableScreenState();
}

class _VegetableScreenState extends State<VegetableScreen> {
  List<String> genderSelect = ['1Kg', '2Kg', '3Kg', '4Kg', '5Kg'];
  dynamic selectGender = '1Kg';

  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 3.h),
                  height: 155.h,
                  width: Get.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 15.w),
                            child: Container(
                              height: 75.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/f.jpg'),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Text(
                                'Fresh red Onions',
                                style: TextStyle(
                                    fontSize: 18.h,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                '\$3.0',
                                style: TextStyle(
                                  fontSize: 18.h,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 25.h),
                              Row(
                                children: [
                                  Container(
                                    height: 30.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.h),
                                      color: Colors.blue.withOpacity(0.1),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: DropdownButton(
                                          value: selectGender,
                                          onChanged: (value) {
                                            setState(() {
                                              selectGender = value;
                                              log(selectGender);
                                            });
                                          },
                                          items: genderSelect
                                              .map((e) => DropdownMenuItem(
                                                    child: Text(e),
                                                    value: e,
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'Out of Stock',
                                    style: TextStyle(
                                        fontSize: 18.h,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 20.w),
                                  Switch(
                                      value: isSwitch,
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitch = value;
                                        });
                                      })
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
