import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/model/product_model.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController{
  bool _getNewProductInProgress=false;
  String _errorMessage='';
  ProductModel _newProductModel =ProductModel();
  
  
  bool get getNewProductInProgress => _getNewProductInProgress;
  String get errorMessage => _errorMessage;
  ProductModel get  newProductModel => _newProductModel;
  
  Future<bool> getNewProducts()async{
    _getNewProductInProgress=true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.getProductByRemark('new'));
    _getNewProductInProgress=false;
    if(response.isSuccess){
      _newProductModel=ProductModel.fromJson(response.body ?? {});
      update();
      return true;
    }else{
      _errorMessage='New product fetch failed! Try again';
      update();
      return false;
    }
  }
}