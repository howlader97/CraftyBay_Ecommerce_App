import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
  bool _addToCartInProgress=false;
  bool get addToCartInProgress => _addToCartInProgress;

  Future<bool> addToCart(int productId,String color, String size, int quantity)async{

    _addToCartInProgress=false;
    update();
    final NetworkResponse response=await NetworkCaller.postRequest(Urls.addToCart,{
      "product_id":productId,
      "color":color,
      "size":size,
    });
    _addToCartInProgress=false;
    update();
    if(response.isSuccess){
      return true;
    }else{
      return false;
    }
  }

}