import 'package:craftybay_ecommerce_app/presentation/ui/widgets/custom_stepper.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                ProductImageSlider(),
                AppBar(
                  leading: BackButton(color: Colors.black54),
                  title: Center(
                    child: Text(
                      "Product Details",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Addidas shoe N1234543")),
               CustomStepper(lowerLimit: 1, upperLimit: 10, stepValue: 1, initialValue: 1, onChange: (newValue){
                 print(newValue);
               })
              ],
            )
          ],
        ),
      ),
    );
  }
}
