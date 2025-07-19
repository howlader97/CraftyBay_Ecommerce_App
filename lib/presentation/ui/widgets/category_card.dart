import 'package:craftybay_ecommerce_app/data/model/category_data.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {
  final CategoryData categoryData;

  const CategoryCard({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              height: 63,
              width: 70,
              margin: EdgeInsets.symmetric(horizontal: 3),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.primaryColor.withAlpha(80),
              ),
              child: Image.network(categoryData.categoryImg ?? ''),
            ),
            const SizedBox(height: 6),
            Text(
              categoryData.categoryName ?? '',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ],
        ),
    );
  }
}
