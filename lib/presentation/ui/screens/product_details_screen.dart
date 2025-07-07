import 'package:craftybay_ecommerce_app/presentation/state_holders/selected_color_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/custom_stepper.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
   ProductDetailsScreen({super.key});

  List<Color> colors=[
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.black,
    Colors.pink,
  ];

   final SelectedColorController _colorController = Get.put(SelectedColorController());
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Addidas shoe N1234543",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CustomStepper(
                        lowerLimit: 1,
                        upperLimit: 10,
                        stepValue: 1,
                        initialValue: 1,
                        onChange: (newValue) {
                          print(newValue);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.star_border,
                            size: 18,
                            color: Colors.amber,
                          ),
                          Text(
                            "4.5",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Card(
                        color: AppColors.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.favorite_border,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text("Color",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black),),
                  const SizedBox(height: 8,),
                  SizedBox(
                    height: 20,
                    child:ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) {
                        return Obx(()=> InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () => _colorController.selectColor(index),
                            child: CircleAvatar(
                              backgroundColor: colors[index],
                              child: _colorController.selectedIndex.value == index
                                  ? const Icon(Icons.done, color: Colors.white,size: 15,)
                                  : SizedBox.shrink(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
