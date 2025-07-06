import 'package:craftybay_ecommerce_app/controller/main_bottom_nav_controller.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/cart_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/category_list_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/home_screen.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatelessWidget {
   MainBottomNavScreen({super.key});

   final MainBottomNavController controller=Get.put(MainBottomNavController());


  List<Widget> _screens= [
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (mainBottomNavController) {
        return Scaffold(
          body: _screens[mainBottomNavController.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainBottomNavController.selectedIndex,
            onTap: mainBottomNavController.changeIndex,
            selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Category"),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout),label: "Cart"),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "WishList"),
              ]
          ),
        );
      }
    );
  }
}
