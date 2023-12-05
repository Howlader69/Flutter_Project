import 'package:ecomerce_project/data/models/slider_data.dart';
import 'package:flutter/material.dart';

import '../../../data/models/category_data.dart';
import '../utility/App_Colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryData});

  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.2),
            ),
            child: Image.network(categoryData.categoryImg ?? '',height: 50,),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            categoryData.categoryName ?? '',
            style: TextStyle(
                fontSize: 15,
                color: AppColors.primaryColor,
                letterSpacing: 0.3),
          )
        ],
      ),
    );
  }
}