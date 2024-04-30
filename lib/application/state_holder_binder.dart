import 'package:ecomerce_project/data/models/cart_list_model.dart';
import 'package:ecomerce_project/presentations/state_holders/Category_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/ProductList_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/Product_details_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/add_to_cart_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/cart_list_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/email_verification_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/home_sliders_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/new_product_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/otp_verification_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/popular_product_controller.dart';
import 'package:ecomerce_project/presentations/state_holders/special_product_controller.dart';
import 'package:get/get.dart';
import '../presentations/state_holders/main_bottom_nav_controller.dart';

class StateholderBinder extends Bindings{
  void dependencies(){
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(HomeSlidersController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(NewProductController());
    Get.put(SpecialProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(ProductListController());
    Get.put(CartListController());
  }
}