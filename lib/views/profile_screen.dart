import 'package:delivery_boy_app/model/req_model/log_out_model.dart';
import 'package:delivery_boy_app/services/api_services.dart';
import 'package:delivery_boy_app/views/insight_screen.dart';
import 'package:delivery_boy_app/views/log_in_screen.dart';
import 'package:delivery_boy_app/views/terms_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'my_review_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'My Account',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25.h,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              height: 170.h,
              width: Get.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('${storage.read('image')}'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 35.h),
                        Text(
                          '${storage.read('name')}',
                          style: TextStyle(color: Colors.black, fontSize: 20.h),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          'Union Market',
                          style: TextStyle(color: Colors.grey, fontSize: 16.h),
                        ),
                        SizedBox(height: 35.h),
                        Text(
                          'Store Profile',
                          style:
                              TextStyle(color: Colors.indigo, fontSize: 18.h),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            commonListTile(
                icon: Icons.insights,
                title: 'Insights',
                onTap: () {
                  Get.to(() => InsightScreen());
                  print('insight');
                }),
            commonListTile(
                icon: Icons.wallet,
                title: 'Wallet',
                onTap: () {
                  print('Wallet');
                }),
            commonListTile(
                icon: Icons.reviews,
                title: 'My Reviews',
                onTap: () {
                  Get.to(() => MyReviewScreen());
                  print('My Reviews');
                }),
            commonListTile(
                icon: Icons.backpack_outlined,
                title: 'Terms & condition',
                onTap: () {
                  Get.to(() => TermsConditionScreen());
                  print('Terms & condition');
                }),
            commonListTile(
                icon: Icons.support,
                title: 'Supports',
                onTap: () {
                  print('Supports');
                }),
            commonListTile(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {
                  print('Settings');
                }),
            commonListTile(
                icon: Icons.logout,
                title: 'Log Out',
                onTap: () async {
                  LogOutModel _model = LogOutModel();
                  _model.token = storage.read('token');
                  int? code = await ApiServices.logOutData(
                    reqBody: _model.toJson(),
                  );
                  if (code == 200) {
                    Get.snackbar('Logout', 'SuccessFully');

                    Get.offAll(() => LogInScreen());
                  }
                  print('Log Out');
                }),
          ],
        ),
      ),
    );
  }
}

InkWell commonListTile(
    {required dynamic icon, required String title, required dynamic onTap}) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
