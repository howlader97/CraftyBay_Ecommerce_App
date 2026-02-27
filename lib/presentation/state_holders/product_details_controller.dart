import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/model/product_details.dart';
import 'package:craftybay_ecommerce_app/data/model/product_details_model.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';
import '../ui/screens/product_details_screen.dart';

/*
class ProductDetailsController extends GetxController{
  bool _getProductDetailsInProgress=false;
   var productDetailsList=<ProductDetails>[].obs;
   String _errorMessage='';
   bool get getProductDetailsInProgress => _getProductDetailsInProgress;
   String get errorMessage => _errorMessage;


   Future<bool>getProductDetails(int id)async
   {
     _getProductDetailsInProgress=true;
     update();
     final NetworkResponse response =await NetworkCaller().getRequest(Urls.getProductDetailsById(id));
     _getProductDetailsInProgress=false;
     print("response.body::: ${response.body}");
     if(response.isSuccess){
       productDetailsList.clear();
       List<dynamic> data = response.body?['data'];
       productDetailsList.addAll(data.map((e) => ProductDetails.fromJson(e)));
       update();
       Get.to(() => ProductDetailsScreen());
      // print("getProductDetails");
     //  print(response.body?['data']);
       return true;
     }else{
       _errorMessage='data fetch failed';
       update();
       return false;
     }
   }
}*/

class ProductDetailsController extends GetxController{
  bool _getProductDetailsInProgress = false;
  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductDetails _productDetails=ProductDetails();
  ProductDetails get productDetails => _productDetails;

  String _errorMessage='';
  final List<String> _availableColors = [];
  List<String> _availableSizes = [];

  List<String> get availableColors => _availableColors;

  List<String> get availableSizes => _availableSizes;


  Future<bool> getProductDetails(int id) async{
    _getProductDetailsInProgress=true;
    update();
    final NetworkResponse response= await NetworkCaller.getRequest(Urls.getProductDetailsById(id));
    _getProductDetailsInProgress =false;
    if(response.isSuccess){
      _productDetails=ProductDetailsModel.fromJson(response.body ?? {}).data!.first;
      _convertStringToColor(_productDetails.color ?? '');
      _convertStringToSizes(_productDetails.size ?? '');
      update();
      return true;
    }else{
      _errorMessage='Failed!,Try again';
      update();
      return false;
    }
  }

  void _convertStringToColor(String color) {
    _availableColors.clear();
    final List<String> splittedColors = color.split(',');
    for (String c in splittedColors) {
      if (c.isNotEmpty) {
        _availableColors.add(c);
      }
    }
  }

  void _convertStringToSizes(String sizes) {
    _availableSizes = sizes.split(',');
  }
}