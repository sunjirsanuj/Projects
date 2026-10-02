import 'package:flutter/material.dart';
import 'package:food_app_clone/utils/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 18),

          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),

          const Expanded(
            child: Text(
              "Search your favourite food...",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),

          Container(
            width: 55,
            height: 52,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.horizontal(right: Radius.circular(28)),
            ),
            child: const Icon(Icons.tune, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
