import 'package:country_code_picker/country_code_picker.dart';
import 'package:delivery_boy_app/model/req_model/log_in_model.dart';
import 'package:delivery_boy_app/views/phone_number_screen.dart';
import 'package:delivery_boy_app/views/registraion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/api_services.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final mobilController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(children: [
            SizedBox(height: 40.h),
            Center(
              child: Image.asset(
                'assets/images/logo.jpeg',
                height: 200,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 40.h),
            Center(
              child: Image.asset(
                'assets/images/logo2.jpeg',
                height: 150,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mobilController,
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        counterText: '',
                        prefixIcon: CountryCodePicker(
                          onChanged: print,
                          initialSelection: 'IT',
                          favorite: ['+39', 'FR'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        hintText: 'Enter Mobile Number',
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.h),
                      ),
                    ),
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        LogInModel _model = LogInModel();
                        _model.mobileNo = mobilController.text;

                        int? code = await ApiServices.logInService(
                            body: _model.toJson());

                        if (code == 200) {
                          Get.snackbar('LogIN', 'SuccessFully');
                          GetStorage().write('mobile', mobilController.text);
                          Get.offAll(() => RegistrationScreen());
                        }
                      }
                    },
                    child: Text('Continue'),
                  ),
                ],
              ),
            ),
            Text(
              'Or',
              style: TextStyle(color: Colors.grey, fontSize: 20.h),
            ),
            MaterialButton(
              height: 60.h,
              color: Colors.blue,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/facebook.png'),
                    height: 17.h,
                  ),
                  SizedBox(width: 30.w),
                  Text(
                    'Continue with Facebook',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.h),
                  ),
                ],
              ),
            ),
            MaterialButton(
              height: 60.h,
              color: Colors.white,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/google.png'),
                    color: Colors.black,
                    height: 20.h,
                  ),
                  SizedBox(width: 35.w),
                  Text(
                    'Continue with Google',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.h),
                  ),
                ],
              ),
            ),
            MaterialButton(
              height: 60.h,
              color: Colors.black,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/apple.png'),
                    height: 20.h,
                  ),
                  SizedBox(width: 30.w),
                  Text(
                    'Continue with Apple',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.h),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
