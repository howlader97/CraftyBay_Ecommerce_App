import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController{
  bool _otpVerificationInProgress=false;
  String _message= '';

  bool get otpVerificationInProgress => _otpVerificationInProgress;
  String get message => _message;
  
  Future<bool> verifyOtp(String email,String otp) async{
    _otpVerificationInProgress=true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _otpVerificationInProgress=false;
    update();
    if(response.isSuccess){
      _message=response.body?['data'] ?? '';
      return true;
    }else{
      return false;
    }
  }
  
}