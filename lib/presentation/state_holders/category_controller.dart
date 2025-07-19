import 'package:craftybay_ecommerce_app/data/model/category_model.dart';
import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  bool _getCategorySliderInProgress=false;
  String _message='';
  CategoryModel _categoryModel=CategoryModel();

  bool get getCategorySliderInProgress => _getCategorySliderInProgress;
  String get message => _message;
  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategories()async{
    _getCategorySliderInProgress=true;
    update();
    final NetworkResponse response= await NetworkCaller().getRequest(Urls.getCategorySliders);
    _getCategorySliderInProgress=false;
    if(response.isSuccess){
      _categoryModel=CategoryModel.fromJson(response.body ?? {});
      update();
      return true;
    }else{
      _message='data failed';
      update();
      return false;
    }
  }
}