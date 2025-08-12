
import 'package:craftybay_ecommerce_app/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/home_slider_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/popular_product_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/special_product_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/image_assets.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/category_card.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/circular_icon_button.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/home/home_section_title.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/home/home_slider.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.logoNavSvg),
            Spacer(),
            CircularIconButton(icon: Icons.person, onTap: () {}),
            const SizedBox(width: 8),
            CircularIconButton(icon: Icons.call, onTap: () {}),
            const SizedBox(width: 8),
            CircularIconButton(icon: Icons.notifications_none, onTap: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
                  hintText: "Search",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),

                  GetBuilder<HomeSliderController>(
                    builder: (homeSliderController) {
                      if(homeSliderController.getHomeSliderInProgress){
                        return SizedBox(
                          height: 180,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return HomeSlider(sliders: homeSliderController.sliderModel.data ?? [],);
                    }
                  ),

              const SizedBox(height: 7),
              HomeSectionTitle(title: "Categories", onTap: () {
                Get.find<MainBottomNavController>().changeIndex(1);
              }),
              SizedBox(
                height: 90,
                child: GetBuilder<CategoryController>(
                  builder: (categoryController) {
                    if(categoryController.getCategorySliderInProgress){
                      return SizedBox(
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryController.categoryModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          categoryData: categoryController.categoryModel.data![index],
                          onTap: (){
                            Get.to(ProductListScreen(categoryId:categoryController.categoryModel.data![index].id!));
                          },
                        );
                      },
                    );
                  }
                ),
              ),
              const SizedBox(height: 3),
              HomeSectionTitle(title: "Popular", onTap: () {
                Get.to(ProductListScreen(productModel: Get.find<PopularProductController>().popularProductModel));
              }),
              SizedBox(
                height: 170,
                child: GetBuilder<PopularProductController>(
                  builder: (productController) {
                    if(productController.getPopularProductInProgress){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.popularProductModel.data?.length ?? 0,
                        itemBuilder: (context,index){
                      return ProductCard(
                        product: productController.popularProductModel.data![index],
                      );
                    }
                     );
                  }
                ),
              ),
              const SizedBox(height: 3),
              HomeSectionTitle(title: "Special", onTap: () {
                Get.to(ProductListScreen(productModel: Get.find<SpecialProductController>().specialProductModel,));
              }),
              SizedBox(
                height: 170,
                child: GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                    if(specialProductController.getSpecialProductInProgress){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: specialProductController.specialProductModel.data?.length ?? 0,
                        itemBuilder: (context,index){
                          return ProductCard(product: specialProductController.specialProductModel.data![index],);
                        });
                  }
                ),
              ),
              const SizedBox(height: 3),
              HomeSectionTitle(title: "New", onTap: () {
                Get.to(ProductListScreen(productModel: Get.find<NewProductController>().newProductModel,));
              }),
              SizedBox(
                height: 170,
                child: GetBuilder<NewProductController>(
                    builder: (newProductController) {
                      if(newProductController.getNewProductInProgress){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: newProductController.newProductModel.data?.length ?? 0,
                          itemBuilder: (context,index){
                            return ProductCard(product: newProductController.newProductModel.data![index],);
                          });
                    }
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}


