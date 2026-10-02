import 'package:flutter/material.dart';
import 'package:food_app_clone/utils/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: const Icon(Icons.location_on_outlined, size: 22),
        ),
        const SizedBox(width: 12),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery To",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 5,),

              Text(
                "Cityroad, Bangladesh",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade200,
            )
          ),
          child: const Icon(Icons.notifications_none,
          size: 23,),
        )
      ],
    );
  }
}
