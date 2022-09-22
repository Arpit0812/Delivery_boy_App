import 'dart:async';
import 'package:get/get.dart';

class IntController extends GetxController {
  var mileCounter = 0.obs;

  updateMileCounter() {
    for (int i = 0; i < 643; i++) {
      mileCounter += 1;
    }
    update();
  }
}
