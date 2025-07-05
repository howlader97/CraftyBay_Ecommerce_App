import 'package:craftybay_ecommerce_app/presentation/ui/screens/splash_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
       /* primarySwatch: MaterialColor(
          AppColors.primaryColor.value,
          AppColors().color,
        ),*/
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.grey),
          ),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF07ADAE)),
        ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF07ADAE),
            padding: EdgeInsets.symmetric(vertical: 12),
            textStyle: TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
