import 'dart:async';

import 'package:delivery_boy_app/controller/time_controller.dart';
import 'package:delivery_boy_app/views/registraion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OtpFieldScreen extends StatefulWidget {
  const OtpFieldScreen({Key? key}) : super(key: key);

  @override
  State<OtpFieldScreen> createState() => _OtpFieldScreenState();
}

class _OtpFieldScreenState extends State<OtpFieldScreen> {
  final verifyController = TextEditingController();

  TimerController timerController = Get.put(TimerController());

  @override
  initState() {
    timerController.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('${timerController.counter.value}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            child: Icon(Icons.arrow_back, color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            }),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Enter verification code we've sent on Given Number",
              style: TextStyle(
                fontSize: 20.h,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextField(
              controller: verifyController,
              decoration: InputDecoration(
                labelText: 'Enter Verification code',
                labelStyle: TextStyle(color: Colors.grey),
                hintText: 'Verification code',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Obx(
                  () => Text(
                    ' ${timerController.counter.value} second',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          MaterialButton(
            minWidth: Get.width,
            height: 60.h,
            color: Colors.indigo,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => RegistrationScreen()));
            },
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
