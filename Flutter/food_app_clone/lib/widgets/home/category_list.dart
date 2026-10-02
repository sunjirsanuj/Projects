import 'package:flutter/material.dart';
import 'package:food_app_clone/data/category_data.dart';
import 'package:food_app_clone/widgets/home/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CategoryCard(category: CategoryData.categories[index]);
        },
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) {
          return const SizedBox(width: 17);
        },
        itemCount: CategoryData.categories.length,
      ),
    );
  }
}
