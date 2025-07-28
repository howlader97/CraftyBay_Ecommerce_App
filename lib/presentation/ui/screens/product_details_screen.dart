import 'package:craftybay_ecommerce_app/presentation/state_holders/product_details_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/selected_color_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/custom_stepper.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {

   ProductDetailsScreen({super.key,});

  final List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.black,
    Colors.pink,
  ];

  final List<String> sizes = ["S", "M", "L", "XL", "XXL"];

  final SelectedColorController _colorController = Get.put(
    SelectedColorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          if (controller.getProductDetailsInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ProductImageSlider(
                                imageList: [
                              controller.productDetailsList[0].img1!,
                              controller.productDetailsList[0].img2!,
                              controller.productDetailsList[0].img3!,
                              controller.productDetailsList[0].img4!,
                            ]),
                            ProductDetailsAppBar,
                          ],
                        ),
                        productDetails( ),
                      ],
                    ),
                  ),
                ),
                cartToCartBottomContainer,
              ],
            ),
          );
        },
      ),
    );
  }

  Padding productDetails() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '',
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
                  Icon(Icons.star_border, size: 18, color: Colors.amber),
                  Text(
                    '', //  "${product.star ?? ''}",
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
          Text(
            "Color",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 28,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => _colorController.selectColor(index),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: colors[index],
                      child:
                          _colorController.selectedIndex.value == index
                              ? const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 15,
                              )
                              : SizedBox.shrink(),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8);
              },
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Size",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 28,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: sizes.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => _colorController.selectedSizeIndex(index),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.primaryColor,
                      child:
                          _colorController.selectedSizeIndex.value == index
                              ? Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  sizes[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                              : CircleAvatar(child: Text(sizes[index])),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8);
              },
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '', // product.shortDes ?? '',
          ),
        ],
      ),
    );
  }

  AppBar get ProductDetailsAppBar {
    return AppBar(
      leading: BackButton(color: Colors.black54),
      title: Text("Product Details", style: TextStyle(color: Colors.black54)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container get cartToCartBottomContainer {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withAlpha(20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "price",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "\$509",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Add to Cart", style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
