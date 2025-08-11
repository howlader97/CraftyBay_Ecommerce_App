import 'package:craftybay_ecommerce_app/application/state_holder_binder.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/splash_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey=GlobalKey<NavigatorState>();
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
      debugShowCheckedModeBanner: false,
      initialBinding: StateHolderBinder(),
      home: SplashScreen(),
      theme: themeData()
    );
  }
}
