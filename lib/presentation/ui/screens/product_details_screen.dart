import 'package:craftybay_ecommerce_app/data/model/product_details.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/add_to_cart_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/product_details_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/selected_color_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/custom_stepper.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
  ];

  final List<String> sizes = ["x", "2x", "3x"];
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  int quantity = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
    super.initState();
  }

  // final SelectedColorController _colorController = Get.put(
  //   SelectedColorController(),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if (productDetailsController.getProductDetailsInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ProductImageSlider(
                            imageList: [
                              productDetailsController.productDetails.img1!,
                              productDetailsController.productDetails.img2!,
                              productDetailsController.productDetails.img3!,
                              productDetailsController.productDetails.img3!,
                              // controller.productDetailsList[0].img4!,
                            ],
                          ),
                          ProductDetailsAppBar,
                        ],
                      ),
                      productDetails(productDetailsController.productDetails,
                          productDetailsController.availableColors),
                    ],
                  ),
                ),
              ),
              cartToCartBottomContainer(
                productDetailsController.productDetails,
                productDetailsController.availableColors,
                productDetailsController.availableSizes
              ),
            ],
          );
        },
      ),
    );
  }

  Padding productDetails(ProductDetails productDetails, List<String> colors) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  // controller.productDetailsList[0].product!.title!,
                  productDetails.product?.title ?? 'no title',
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
                    "${productDetails.product?.star}", //  "${product.star ?? ''}",
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
            child: SizedBox(
              height: 28,
              child: SizePicker(
                initialSelected: 0,
                onSelected: (int selectedSize) {
                  _selectedColorIndex = selectedSize;
                },
                sizes: productDetails.color?.split(',') ?? [],
              ),
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
            child: SizedBox(
              height: 28,
              child: SizePicker(
                initialSelected: 0,
                onSelected: (int selectedSize) {
                  _selectedSizeIndex = selectedSize;
                },
                sizes: productDetails.size?.split(',') ?? [],
              ),
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
            '${productDetails.product?.shortDes}', // product.shortDes ?? '',
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

  Container cartToCartBottomContainer(ProductDetails details, List<String> colors, List<String> sizes) {
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
            child: GetBuilder<AddToCartController>(
              builder: (addToCartController) {
                if(addToCartController.addToCartInProgress){
                  return Center(child: CircularProgressIndicator(),);
                }
                return ElevatedButton(
                  onPressed: () async {
                   final result = await  addToCartController.addToCart(details.id!, colors[_selectedColorIndex].toString(), sizes[_selectedSizeIndex], quantity,
                    );
                    if (result) {
                      Get.snackbar('Added to cart',
                          'This product has been added to cart list',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: Text("Add to Cart", style: TextStyle(color: Colors.black)),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
