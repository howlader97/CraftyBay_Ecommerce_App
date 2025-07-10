import 'dart:convert';
import 'dart:developer';
import 'package:craftybay_ecommerce_app/data/model/network_response.dart';
import 'package:http/http.dart';



class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      // log(url);
      Response response = await get(Uri.parse(url),
        //  headers: {'token': AuthUtility.userInfo.token.toString()}
            );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      }else if (response.statusCode == 401) {
        goToLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body,{bool isLogin=false}) async {
    try {
      Response response = await post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
           // 'token': AuthUtility.userInfo.token.toString()
          },
          body: jsonEncode(body));
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if(isLogin ==false) {
          goToLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  void goToLogin() {
    // Navigator.pushAndRemoveUntil(
    //     TaskManagerApp.globalKey.currentContext!,
    //     MaterialPageRoute(builder: (context) => const LoginScreen()),
    //         (route) => false);
  }
}

