

import 'package:ecomerce_project/presentations/state_holders/new_product_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/special_product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../state_holders/Category_controller.dart';
import '../../state_holders/home_sliders_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/popular_product_controller.dart';
import '../utility/App_Colors.dart';
import 'Cart_Screen.dart';
import 'Category_list_Screen.dart';
import 'Wish_list.dart';
import 'homeScreen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  MainBottomNavController mainBottomNavController=Get.put(MainBottomNavController());
  final List<Widget> _screens = [
    const homeScreen(),
    const CategoryListScreen(),
    const CartScreen(),
    const WishList(),
  ];
  //int selectedIndex=0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSlidersController>().getHomeSliders();
      Get.find<CategoryController>().getCategories();
      Get.find<PopularProductController>().getPopularProducts();
      Get.find<NewProductController>().getNewProducts();
      Get.find<SpecialProductController>().getSpecialProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return GetBuilder<MainBottomNavController>(

        builder: (controler) {
          return Scaffold(
            body: _screens[mainBottomNavController.CurrentSelectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: mainBottomNavController.CurrentSelectedIndex,
              onTap: mainBottomNavController.changeScreen,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              elevation: 4,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.dashboard,
                    ),
                    label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart,
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border,
                    ),
                    label: 'Wishlist'),
              ],
            ),

    );
        }
      );
  }
}