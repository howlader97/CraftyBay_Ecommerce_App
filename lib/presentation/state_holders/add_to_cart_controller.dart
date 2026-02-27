import 'package:craftybay_ecommerce_app/data/services/add_to_cart_request_api.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/auth_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/cart_list_controller.dart';
import 'package:get/get.dart';

import '../ui/screens/auth/email_verification_screen.dart';

class AddToCartController extends GetxController{
  bool _addToCartInProgress=false;
  bool get addToCartInProgress => _addToCartInProgress;

  Future<dynamic> addToCart(int productId,String color, String size, int quantity)async{

    _addToCartInProgress=true;
    update();
    final  response=await AddToCartApiServices.addToCartRequest(Urls.addToCart,{
      "product_id":productId,
      "color":color,
      "size":size,
      "qty":quantity
    });
    _addToCartInProgress=false;
    update();
    if(response.statusCode == 200){
       Get.find<CartListController>().getCartList();
      return true;
    }else if(response.statusCode == 401){
          goToLogin();
    }
    else{
      return false;
    }
  }

  static Future<void> goToLogin()async{
    await AuthController.clear();
    Get.offAll(() => EmailVerificationScreen());
  }

}