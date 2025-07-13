import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:craftybay_ecommerce_app/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController{
  bool _emailVerificationInProgress = false;
  String _message='';

  bool get emailVerificationInProgress => _emailVerificationInProgress;
  String get message => _message;

  Future<bool> verifyEmail(String email) async{
    _emailVerificationInProgress=true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.verifyEmail(email));
    _emailVerificationInProgress=false;
    update();
    print(response.body);
    //if(response.statusCode ==200){
    if(response.isSuccess){
      _message=response.body?['data'] ?? '';
      return true;
    }else{
      return false;
    }
  }
}