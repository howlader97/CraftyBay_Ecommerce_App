
import 'package:get/get.dart';

class SelectedColorController extends GetxController {
   RxInt selectedIndex = 0.obs;
   RxInt selectedSizeIndex = 0.obs;

  void selectColor(int index) {
    selectedIndex.value = index;
    update();
  }
  void selectSize(int index){
    selectedSizeIndex.value=index;
    update();
  }
}