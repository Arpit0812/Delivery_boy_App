import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Terms & Condition',
          style: TextStyle(
              color: Colors.black, fontSize: 18.h, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: () {
              Get.back();
            }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(thickness: 20.h),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terms & Condition',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.h,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                Text(
                  textAlign: TextAlign.justify,
                  'Terms and conditions provide clarity about what should happen in any given situation. They set out the key commercial terms you are offering to your clients and helps the contractual parties to understand their duties, rights, roles and responsibilities',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.h,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  textAlign: TextAlign.justify,
                  "Copying someone else's terms and conditions is illegal. Under US copyright laws, terms and conditions are copyright protected. Your competitors don't have to look hard to find out that you stole their policies.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.h,
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Company Policy',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.h,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                SizedBox(height: 10.h),
                Text(
                  textAlign: TextAlign.justify,
                  'Terms and conditions provide clarity about what should happen in any given situation. They set out the key commercial terms you are offering to your clients and helps the contractual parties to understand their duties, rights, roles and responsibilities',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.h,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  textAlign: TextAlign.justify,
                  "Copying someone else's terms and conditions is illegal. Under US copyright laws, terms and conditions are copyright protected. Your competitors don't have to look hard to find out that you stole their policies.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
