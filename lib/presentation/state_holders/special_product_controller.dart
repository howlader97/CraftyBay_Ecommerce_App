import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/model/product_model.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController{
  bool _getSpecialProductInProgress=false;
  String _errorMessage='';
  ProductModel _specialProductModel =ProductModel();
  
  
  bool get getSpecialProductInProgress => _getSpecialProductInProgress;
  String get errorMessage => _errorMessage;
  ProductModel get  specialProductModel => _specialProductModel;
  
  Future<bool> getSpecialProducts()async{
    _getSpecialProductInProgress=true;
    update();
    final NetworkResponse response=await NetworkCaller.getRequest(Urls.getProductByRemark('special'));
    _getSpecialProductInProgress=false;
    if(response.isSuccess){
      _specialProductModel=ProductModel.fromJson(response.body ?? {});
      update();
      return true;
    }else{
      _errorMessage='Special product fetch failed! Try again';
      update();
      return false;
    }
  }
}