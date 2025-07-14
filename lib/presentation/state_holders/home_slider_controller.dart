import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/model/slider_model.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{
  bool _getHomeSliderInProgress=false;
  String _message='';
  SliderModel _sliderModel=SliderModel();

  bool get getHomeSliderInProgress => _getHomeSliderInProgress;
  String get message => _message;
  SliderModel get sliderModel => _sliderModel;

  Future<bool> getHomeSlider()async{
    _getHomeSliderInProgress=true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.getHomeSliders);
    _getHomeSliderInProgress=false;
    if(response.isSuccess){
      _sliderModel=SliderModel.fromJson(response.body ?? {} );
      update();
      return true;
    }else{
      update();
      return false;

    }
  }
}