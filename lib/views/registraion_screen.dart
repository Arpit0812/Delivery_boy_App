// ignore_for_file: override_on_non_overriding_member

import 'package:delivery_boy_app/model/req_model/register_model.dart';
import 'package:delivery_boy_app/services/api_services.dart';
import 'package:delivery_boy_app/views/bottom_navigation_screen.dart';
import 'package:delivery_boy_app/views/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  final nameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final phonesController = TextEditingController();
  final _key = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            commonRow(
              icon: Icons.person,
              controller: nameController,
              label: 'FULL NAME',
              hint: 'Enter your full name',
            ),
            commonRow(
                icon: Icons.email_outlined,
                controller: emailAddressController,
                label: 'EMAIL ADDRESS',
                hint: 'Enter your email  Adress'),
            commonRow(
                icon: Icons.phone_android,
                controller: phonesController,
                label: 'MOBILE NUMBER',
                hint: 'Enter your mobile number'),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 30.w),
                Flexible(
                  child: Text(
                    "We'll send verification code on above Given Number",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            MaterialButton(
              minWidth: Get.width,
              height: 60.h,
              color: Colors.indigo,
              onPressed: () async {
                if (_key.currentState!.validate()) {
                  RegisterModel _model = RegisterModel();
                  _model.mobileNo = phonesController.text;
                  _model.name = nameController.text;
                  _model.email = emailAddressController.text;
                  _model.loginBy = '1';
                  int? code =
                      await ApiServices.registerData(reqBody: _model.toJson());
                  if (code == 200) {
                    Get.snackbar('Register', 'Successfully');
                    Get.to(() => BottomBar());
                  }
                }
              },
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget commonRow({
  required dynamic icon,
  required TextEditingController controller,
  required String hint,
  required String label,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.green,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'required field';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: hint,
              labelText: label,
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
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
  );
}
