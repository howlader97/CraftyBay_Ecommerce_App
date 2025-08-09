import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
bool _addToCartInProgress = false;
String _message='';

bool get addToCartInProgress => _addToCartInProgress;
String get message => _message;
Future<bool> addToCart(int productId)async{
  _addToCartInProgress=true;
  update();
  final NetworkResponse response=await NetworkCaller().postRequest(Urls.addToCart, {
      "product_id":productId,
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