import 'package:craftybay_ecommerce_app/data/model/product.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/product_details_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({super.key, required this.product});

  //final _productDetailsController = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(" product id ....${product.id}");
        // _productDetailsController.getProductDetails(9);
        Get.to(ProductDetailsScreen(productId: product.id! ,));

      },
      borderRadius: BorderRadius.circular(8),
      child: Card(
        shadowColor: AppColors.primaryColor.withAlpha(10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: 130,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Image.network(
                  product.image ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      product.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${product.price ?? 0}",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.star_border,
                              size: 18,
                              color: Colors.amber,
                            ),
                            Text(
                              "${product.star ?? 0}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
