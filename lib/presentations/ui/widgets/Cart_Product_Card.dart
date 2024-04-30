import 'package:ecomerce_project/presentations/state_holders/cart_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/cart_list_model.dart';
import '../utility/App_Colors.dart';
import 'Custom_Stepper.dart';

class CartProductCard extends StatelessWidget {
  final CartData cartData;
  const CartProductCard({
    super.key, required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration:  BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(cartData.product?.image ?? ''))),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartData.product?.title ?? '',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          RichText(
                              text:  TextSpan(
                                  style: TextStyle(color: Colors.black54),
                                  children: [
                                TextSpan(
                                  text: 'Color:${cartData.color ?? ''}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                                TextSpan(text: 'Size:${cartData.size}'),
                              ]))
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      '\$${cartData.product?.price ?? ''}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      width: 80,
                      child: FittedBox(
                        child: CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 10,
                            stepValue: 1,
                            value: cartData.quantity ?? 1,
                            onChange: (int value) {
                              Get.find<CartListController>().changeItem(cartData.id!, value);
                            }),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}


