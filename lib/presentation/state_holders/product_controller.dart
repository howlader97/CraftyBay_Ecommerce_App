import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/model/product_model.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  bool _getPopularProductInProgress = false;
  String _errorMessage = '';
  ProductModel _popularProductModel = ProductModel();

  bool get getPopularProductInProgress => _getPopularProductInProgress;
  String get errorMessage => _errorMessage;
  ProductModel get popularProductModel => _popularProductModel;

  Future<bool> getPopularProducts() async {
    _getPopularProductInProgress=true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductByRemark('popular'),);
    _getPopularProductInProgress=false;
    if(response.isSuccess){
      _popularProductModel=ProductModel.fromJson(response.body ?? {});
      update();
      return true;
    }else{
      _errorMessage='Popular product fetch failed! Try again';
      update();
      return false;
    }
  }
}
