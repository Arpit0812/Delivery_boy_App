import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt counter = 60.obs;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter.value > 0) {
        counter.value--;
      } else {
        timer.cancel();
      }
    });
  }
}
