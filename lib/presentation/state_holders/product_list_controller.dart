import 'package:craftybay_ecommerce_app/data/model/category_model.dart';
import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/model/product_model.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

  class ProductListController extends GetxController {
  bool _getProductsInProgress = false;
  ProductModel _productModel = ProductModel();
  String _message = '';

  ProductModel get productModel => _productModel;

  bool get getProductsInProgress => _getProductsInProgress;

  String get message => _message;

  Future<bool> getProductsByCategory(int categoryId) async {
  _getProductsInProgress = true;
  update();
  final NetworkResponse response =
  await NetworkCaller.getRequest(Urls.getProductsByCategory(categoryId));
  _getProductsInProgress = false;
  if (response.isSuccess) {
  _productModel = ProductModel.fromJson(response.body ?? {});
  update();
  return true;
  } else {
  _message = 'Product list data fetch failed!';
  update();
  return false;
  }
  }

  }