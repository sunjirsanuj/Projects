import 'package:flutter/material.dart';
import 'package:food_app_clone/data/food_data.dart';
import 'package:food_app_clone/widgets/home/food_card.dart';

class FoodGrid extends StatelessWidget {
  const FoodGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:  FoodData.foods.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 15,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index){
        return FoodCard(
          food: FoodData.foods[index],
        );
      }
    );
  }
}
