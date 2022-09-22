import 'package:delivery_boy_app/views/otp_field_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneNumberScreen extends StatefulWidget {
  final mobileNo;
  PhoneNumberScreen({Key? key, this.mobileNo}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final mController = TextEditingController();

  @override
  void initState() {
    mController.text = widget.mobileNo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Hey Virat',
              style: TextStyle(
                fontSize: 25.h,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "You're almost in.\n provide your phone number\n for verification",
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
            child: Row(
              children: [
                Icon(Icons.mobile_screen_share_outlined),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    controller: mController,
                    decoration: InputDecoration(
                      hintText: ' Mobile Number',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Text(
              "We'll  send verification code on above given number.",
              style: TextStyle(
                fontSize: 16.h,
                color: Colors.grey,
              ),
            ),
          ),
          Spacer(),
          MaterialButton(
            minWidth: Get.width,
            height: 60.h,
            color: Colors.indigo,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => OtpFieldScreen()));
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
