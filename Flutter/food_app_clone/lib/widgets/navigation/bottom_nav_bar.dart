import 'package:flutter/material.dart';
import 'package:food_app_clone/utils/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 5),
          )
        ]

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item(icon: Icons.home_rounded, title: "Home", selected: true),
          _item(icon: Icons.shopping_cart_outlined, title: "Cart"),
          _item(icon: Icons.favorite_border, title: "Wishlist"),
          _item(icon: Icons.person_2_outlined, title: "Profile"),
        ],
      ),
    );
  }

  Widget _item({
    required IconData icon,
    required String title,
    bool selected = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: selected
              ? const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                )
              : null,
          child: Icon(
            icon,
            size: 24,
            color: selected ? Colors.black : Colors.grey,
          ),
        ),

        Text(
          title,
          style: TextStyle(
            fontSize: 9,
            color: selected ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}
