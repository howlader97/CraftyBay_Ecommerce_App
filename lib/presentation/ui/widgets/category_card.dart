import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(16),
            color: AppColors.primaryColor.withAlpha(20),
            child: Icon(Icons.shop,size: 32,color: AppColors.primaryColor,),
          ),
          const SizedBox(height: 6,),
          Text("Electronics",style: TextStyle(color: AppColors.primaryColor),)
        ],
      ),
    );
  }
}