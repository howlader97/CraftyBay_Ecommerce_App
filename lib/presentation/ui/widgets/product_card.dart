import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.primaryColor.withAlpha(10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: 130,
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withAlpha(20),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Image.asset(ImageAssets.shoePng),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    "Nike shoe Ak50490",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w500,color: Colors.blueGrey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$90",style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.w500),),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.star_border,
                            size: 18,
                            color: Colors.amber,
                          ),
                          Text("4.5",style: TextStyle( fontSize: 14,
                              fontWeight: FontWeight.w500,color: Colors.blueGrey),),
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
    );
  }
}