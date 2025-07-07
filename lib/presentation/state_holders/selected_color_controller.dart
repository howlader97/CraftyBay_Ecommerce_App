
import 'package:get/get.dart';

class SelectedColorController extends GetxController {
   RxInt selectedIndex = 0.obs;

  void selectColor(int index) {
    selectedIndex.value = index;
  }
}