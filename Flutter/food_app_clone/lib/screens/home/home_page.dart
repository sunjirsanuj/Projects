import 'package:flutter/material.dart';
import 'package:food_app_clone/utils/app_colors.dart';
import 'package:food_app_clone/widgets/home/category_list.dart';
import 'package:food_app_clone/widgets/home/food_grid.dart';
import 'package:food_app_clone/widgets/home/home_header.dart';
import 'package:food_app_clone/widgets/home/promo_banner.dart';
import 'package:food_app_clone/widgets/home/search_bar.dart';
import 'package:food_app_clone/widgets/home/section_title.dart';
import 'package:food_app_clone/widgets/navigation/bottom_nav_bar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body:  SafeArea(child: 
      SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 100,),
        child: Column(
          children: [
            const HomeHeader(),
            const SizedBox(height: 22,),

            const HomeSearchBar(),
            const SizedBox(height: 22,),

            const PromoBanner(),
            const SizedBox(height: 22,),

            const SectionTitle(title: "Categories",),
            const SizedBox(height: 14,),

            const CategoryList(),
            const SizedBox(height: 22,),

            const SectionTitle(title: "Popular Food",),
            const SizedBox(height: 14,),

            const FoodGrid(),
          ],
        ),
      ),),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}