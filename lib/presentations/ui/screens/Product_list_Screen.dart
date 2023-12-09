


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../state_holders/ProductList_controller.dart';
import '../widgets/Product_Card.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;
  const ProductListScreen({super.key, required this.categoryId});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ProductListController>().getProductsByCategory(widget.categoryId);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Product List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GetBuilder<ProductListController>(
        builder: (productListController) {
          if(productListController.getProductsInProgress){
           return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(productListController.productModel.data?.isEmpty ?? true){
            return const Center(
              child: Text('Empty List'),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              itemCount: productListController.productModel.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                   return FittedBox(
                       child: ProductCard(
                         product: productListController.productModel.data![index],
                   ));
                }),
          );
        }
      ),
    );
  }
}
