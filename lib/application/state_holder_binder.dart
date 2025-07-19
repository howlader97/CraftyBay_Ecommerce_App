import 'package:craftybay_ecommerce_app/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/email_verification_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/home_slider_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/otp_verification_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/product_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/selected_color_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/stepper_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(StepperController());
    Get.put(SelectedColorController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(ProductController());

  }

}