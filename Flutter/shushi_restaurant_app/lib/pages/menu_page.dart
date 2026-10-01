import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shushi_restaurant_app/componentes/button.dart';
import 'package:shushi_restaurant_app/componentes/food_tile.dart';
import 'package:shushi_restaurant_app/models/food.dart';
import 'package:shushi_restaurant_app/pages/food_detail_page.dart';
import 'package:shushi_restaurant_app/themes/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // food menu
  List FoodMenu = [
    // fish egg
    Food(
      name: "Fish Eggs",
      price: "30.0",
      imagePath: "lib/images/fish-eggs.png",
      rating: "5.9",
    ),

    // salmon sushi
    Food(
      name: "Salmon Sushi",
      price: "15.5",
      imagePath: "lib/images/salmon_sushi.png",
      rating: "4.6",
    ),

    // tuna
    Food(
      name: "Tuna",
      price: "25.0",
      imagePath: "lib/images/sashimi.png",
      rating: "4.9",
    ),
  ];

  // navigate to food item details page
  void navigateToFoodDetailPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(food: FoodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.grey[900]),
        centerTitle: true,
        title: Text("Tokyo", style: TextStyle(color: Colors.grey[900])),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  children: [
                    // promo message
                    Text(
                      "Get 32% promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // redeem button
                    MyButton(text: "Redeem", onTap: () {}),
                  ],
                ),

                //image
                Image.asset("lib/images/sushi.png", height: 100),
              ],
            ),
          ),
          const SizedBox(height: 5),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Here..",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Food Menu",
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: FoodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: FoodMenu[index],
                onTap: () => navigateToFoodDetailPage(index),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // image
                Row(
                  children: [
                    Image.asset("lib/images/salmon_eggs.png", height: 55),
                    const SizedBox(width: 10),

                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),

                        // price
                        Text("\$20.0"),
                      ],
                    ),
                  ],
                ),

                // heart
                Icon(Icons.favorite_border, color: Colors.grey, size: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
