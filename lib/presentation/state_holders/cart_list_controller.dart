import 'dart:convert';

import 'package:craftybay_ecommerce_app/data/model/cart_list_model.dart';
import 'package:craftybay_ecommerce_app/data/utility/urls.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:get/get.dart';

import '../../data/services/cart_list_api_services.dart';

class CartListController extends GetxController {
  bool cartListInProgress = false;
  CartListModel _cartListModel = CartListModel();

  CartListModel get cartListModel => _cartListModel;
  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  Future<bool> getCartList() async {
    cartListInProgress = true;
    update();
    try {
      final response = await CartListApiServices.cartListApiRequest(
        Urls.cartList,
      );
      cartListInProgress = false;
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        _cartListModel = CartListModel.fromJson(jsonDecode(response.body));
        _calculateTotalPrice();
        update();
        return true;
      } else if (response.statusCode == 401) {
        Get.offAll(() => EmailVerificationScreen());
        return false;
      } else {
        update();
        return false;
      }
    } catch (e) {
      cartListInProgress = false;
      update();
      throw 'error is $e';
    }
  }

  void changeItem(int cartId, int noOfItems) {
    _cartListModel.data?.firstWhere((e) => e.id == cartId).numberOfItems =
        noOfItems;
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    _totalPrice=0;
    for (CartData data in _cartListModel.data ?? []) {
      _totalPrice +=
          (data.numberOfItems *
              (double.tryParse(data.product?.price ?? '0') ?? 0));
    }
    print(_totalPrice);
    update();
  }

  @override
  void onInit() {
    getCartList();
    super.onInit();
  }
}
