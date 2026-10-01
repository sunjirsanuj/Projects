//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shushi_restaurant_app/componentes/button.dart';
import 'package:shushi_restaurant_app/models/food.dart';
import 'package:shushi_restaurant_app/themes/colors.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  // quantity count
  int totalQuantity = 0;

  // decrement quantity
  void decrementQuantity() {
    setState(() {
      if (totalQuantity > 0) totalQuantity--;
    });
  }

  // increment quantity
  void incrementQuantity() {
    setState(() {
      totalQuantity++;
    });
  }

  void addToCart() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),

      body: Column(
        children: [
          // list view of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.asset(widget.food.imagePath, height: 200),
                  const SizedBox(height: 25),

                  // rating
                  Row(
                    children: [
                      // star
                      Icon(Icons.star, color: Colors.yellow[900]),
                      const SizedBox(width: 5),

                      // rating number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 25),

                  // description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "A delicious blend of rich flavors and aromatic spices, prepared with fresh ingredients and cooked to perfection. Tender, juicy, and slightly crispy on the outside, with a warm and satisfying taste that makes every bite irresistible. It is finished with a hint of fresh herbs and a touch of creamy richness. Perfectly balanced in texture and flavor, making it a comforting choice for any time of the day.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      '\$' + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    //quantity
                    Row(
                      children: [
                        // minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                        ),

                        // quantity count
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              totalQuantity.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        // plus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // add to cart button
                MyButton(text: "Add to Cart", onTap: () => addToCart()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
