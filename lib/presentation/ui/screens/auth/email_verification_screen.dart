import 'package:craftybay_ecommerce_app/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
              TextFormField(),
              const SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){},
                    child: Text("Text",style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
