import 'package:craftybay_ecommerce_app/presentation/state_holders/auth_controller.dart';
import 'package:http/http.dart' as http;
class CartListApiServices{
  static Future<http.Response> cartListApiRequest(String url)async{
    String? token=await AuthController.getAccessToken();
   try{
     final response=await http.get(Uri.parse(url),headers: {
       "Content-Type":"application/json",
       "token":"$token"
     });
     return response;
   }catch(e){
     throw 'Error is $e';
   }
  }
}