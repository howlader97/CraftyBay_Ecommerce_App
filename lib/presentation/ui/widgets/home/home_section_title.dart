import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const HomeSectionTitle({
    super.key, required this.title, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 18),),
        TextButton(onPressed: onTap, child: Text("See all",style: TextStyle(color: AppColors.primaryColor),))
      ],
    );
  }
}