import 'package:craftybay_ecommerce_app/presentation/state_holders/product_list_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;
  const ProductListScreen({super.key, required this.categoryId});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      Get.find<ProductListController>().getProductsByCategory(widget.categoryId);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        leading: BackButton(),
        title: Text(
          "Product",
          style: TextStyle(fontSize: 22, color: AppColors.primaryColor),
        ),
      ),
      body: GetBuilder<ProductListController>(
        builder: (productListController) {
          if(productListController.getProductsInProgress){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(productListController.productModel.data?.isEmpty ?? true){
            return const Center(
              child:  Text('Empty List'),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: productListController.productModel.data?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                    child: ProductCard(
                  product: productListController.productModel.data![index],)

                );
              },
            ),
          );
        }
      ),
    );
  }
}
