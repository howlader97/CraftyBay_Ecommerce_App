import 'package:craftybay_ecommerce_app/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utility/image_assets.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Center(child: SvgPicture.asset(ImageAssets.baseUrl, width: 100)),
                const SizedBox(height: 14),
                Text(
                  "Enter Your Otp Code",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 28,
                    letterSpacing: 0.1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "A 4 digit otp has been sent",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.primaryColor,
                    selectedColor: Colors.green,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                  },
                  beforeTextPaste: (text) {
                    return true;
                  }, appContext: context,

                ),

                const SizedBox(height: 14),
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(CompleteProfileScreen());
                    },
                    child: Text("Next", style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'This code will expire in ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: ' 120s',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(onPressed: (){}, child: Text("Resend",style:TextStyle(color: Colors.grey)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
