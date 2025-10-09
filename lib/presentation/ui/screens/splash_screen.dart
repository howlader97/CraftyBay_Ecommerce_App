import 'package:craftybay_ecommerce_app/presentation/state_holders/auth_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotoNextScreen();
  }

  void gotoNextScreen() async {
   AuthController.getAccessToken();
    Future.delayed(Duration(seconds: 2)).then((value) {
     Get.offAll(() => AuthController.isLoggedIn ? MainBottomNavScreen() :EmailVerificationScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset(ImageAssets.baseUrl, width: 100),
            Spacer(),
            CircularProgressIndicator(color: Color(0xFF07ADAE)),
            const SizedBox(height: 20),
            Text("Version 1.0.0"),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
