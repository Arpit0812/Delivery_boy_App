import 'package:get/get.dart';

class BottomController extends GetxController {
  var selectedPage = 0.obs;

  selectItem(index) {
    selectedPage.value = index;
    update();
  }
}
