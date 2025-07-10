import 'package:craftybay_ecommerce_app/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
   EmailVerificationScreen({super.key});

  final TextEditingController _emailTEController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                Center(child: SvgPicture.asset(ImageAssets.baseUrl, width: 100)),
                const SizedBox(height: 14),
                Text(
                  "Welcome Back",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 4),
                Text(
                  "Please enter your email address",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailTEController,
                  validator: (String? value){
                    if(value?.isEmpty ?? true){
                      return 'Enter your email address';
                    }else if(value?.isEmail == false){
                      return 'Enter your valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email"
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        Get.to(OtpVerificationScreen());
                      }
                    },
                    child: Text("Text", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
