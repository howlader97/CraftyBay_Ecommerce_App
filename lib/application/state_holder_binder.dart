import 'package:craftybay_ecommerce_app/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/selected_color_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/stepper_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(StepperController());
    Get.put(SelectedColorController());

  }

}