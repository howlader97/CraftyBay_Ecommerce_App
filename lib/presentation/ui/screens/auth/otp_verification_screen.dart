import 'package:craftybay_ecommerce_app/presentation/state_holders/otp_verification_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utility/image_assets.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String email;
   OtpVerificationScreen({super.key, required this.email});

  final TextEditingController _otpTEController=TextEditingController();

  Future<void> verifyOtp(OtpVerificationController otpController) async{
    final response=await otpController.verifyOtp(email ,_otpTEController.text.trim());
    print(response);
    if (!response) {
       Get.offAll(() => MainBottomNavScreen());
    } else {
      Get.snackbar('email verification failed! ', 'Try again',snackPosition: SnackPosition.BOTTOM);
    }
  }

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
                  controller: _otpTEController,
                  length: 6,
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
                  child: GetBuilder<OtpVerificationController>(
                    builder: (otpController) {
                      if(otpController.otpVerificationInProgress){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return ElevatedButton(
                        onPressed: () {
                          verifyOtp(otpController);
                        },
                        child: Text("Next", style: TextStyle(color: Colors.white)),
                      );
                    }
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
