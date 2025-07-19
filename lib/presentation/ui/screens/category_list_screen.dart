import 'package:craftybay_ecommerce_app/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.find<MainBottomNavController>().backToHome();
        }, icon: Icon(Icons.arrow_back,color: Colors.black54,)),
        title: Text("Category",style: TextStyle(fontSize: 22,color: AppColors.primaryColor,),),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          Get.find<CategoryController>().getCategories();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<CategoryController>(
            builder: (categoryController) {
              if(categoryController.getCategorySliderInProgress){
                return SizedBox(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return GridView.builder(
                shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: categoryController.categoryModel.data?.length ?? 0,
                  itemBuilder: (context,index){
                    return FittedBox(child: CategoryCard(
                      categoryData: categoryController.categoryModel.data![index],
                    ));

                  });
            }
          ),
        ),
      ),
    );
  }
}
