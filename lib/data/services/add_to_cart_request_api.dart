
import 'dart:convert';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../presentation/state_holders/auth_controller.dart';

class AddToCartApiServices{
 static Future<http.Response> addToCartRequest(String url,Map<String,dynamic>body)async{

   String? token=await AuthController.getAccessToken();
   if(token == null){
     Get.off(() =>EmailVerificationScreen());
   }
   try{
      final response=await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'token': '$token',
      },
          body: jsonEncode(body));
      print(response.statusCode);
      print("cart response body ${response.body}");
      print(token);
      return response;
    }catch(e){
      throw 'error Occure $e';
    }
  }

}


