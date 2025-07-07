import 'package:craftybay_ecommerce_app/application/state_holder_binder.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/splash_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: StateHolderBinder(),
      home: SplashScreen(),
      theme: themeData()
    );
  }
}
