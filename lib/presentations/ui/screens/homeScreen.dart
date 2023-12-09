import 'package:ecomerce_project/presentations/state_holders/Category_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/home_sliders_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/new_product_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/special_product_controller.dart';
import 'package:ecomerce_project/presentations/ui/screens/Product_list_Screen.dart';
import 'package:ecomerce_project/presentations/ui/utility/imager_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/popular_product_controller.dart';
import '../widgets/Circular_icon_button.dart';
import '../widgets/Product_Card.dart';
import '../widgets/Section_header.dart';
import '../widgets/categoryCard.dart';
import '../widgets/home_Slider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImagesAssets.craftBayLogoNavSVG),
            const Spacer(),
            CirculariconButton(
              icon: Icons.person,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CirculariconButton(
              icon: Icons.call,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CirculariconButton(
              icon: Icons.notifications_none,
              onTap: () {},
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSlidersController>(
                  builder: (homeSliderController) {
                if (homeSliderController.getHomeSlidersInProgress) {
                  return const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeSlider(
                  sliders: homeSliderController.sliderModel.data ?? [],
                );
              }),
              Sectionheader(
                title: 'Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              SizedBox(
                height: 100,
                child: GetBuilder<CategoryController>(
                    builder: (categoryController) {
                  if (categoryController.getCategoriesInProgress) {
                    return const SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          categoryController.categoryModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                            categoryData: categoryController.categoryModel.data![index],
                          onTap: (){
                            Get.to(ProductListScreen(categoryId: categoryController.categoryModel.data![index].id!));
                          },
                        );
                      });
                }),
              ),
              const SizedBox(
                height: 8,
              ),
              Sectionheader(
                title: 'Popular',
                onTap: () {
                  Get.to(ProductListScreen(
                    productModel:  Get.find<PopularProductController>().popularProductModel,
                  ));
                },
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<PopularProductController>(
                  builder: (productController) {
                    if (productController.getPopularProductsInProgress) {
                      return const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.popularProductModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return  ProductCard(
                            product: productController.popularProductModel.data![index],
                          );
                        });
                  }
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Sectionheader(
                title: 'Special',
                onTap: () {
                  Get.to(ProductListScreen(
                    productModel:  Get.find<SpecialProductController>().specialProductModel,
                  ));
                },
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<SpecialProductController>(
                    builder: (productController) {
                      if (productController.getSpecialProductsInProgress) {
                        return const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productController.specialProductModel.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return  ProductCard(
                              product: productController.specialProductModel.data![index],
                            );
                          });
                    }
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Sectionheader(
                title: 'New',
                onTap: () {
                 Get.to(ProductListScreen(
                   productModel:  Get.find<NewProductController>().newProductModel,
                 ));
                },
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<NewProductController>(
                    builder: (productController) {
                      if (productController.getNewProductsInProgress) {
                        return const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productController.newProductModel.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return  ProductCard(
                              product: productController.newProductModel.data![index],
                            );
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
