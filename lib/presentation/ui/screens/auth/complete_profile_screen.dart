import 'package:craftybay_ecommerce_app/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                Center(child: SvgPicture.asset(ImageAssets.baseUrl, width: 100)),
                const SizedBox(height: 14),
                Text(
                  "Complete Profile",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 4),
                Text(
                  "Get started with us by share your details",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "First Name"
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Last Name"
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Mobile"
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "City"
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(

                      hintText: "Shiping address",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16)
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
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
