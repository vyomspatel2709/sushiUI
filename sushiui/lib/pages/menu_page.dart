import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushiui/components/food_tile.dart';
import 'package:sushiui/models/foods.dart';
import 'package:sushiui/components/button.dart';
import 'package:sushiui/models/shop.dart';
import 'package:sushiui/pages/food_details.dart';
import 'package:sushiui/themes/color.dart';

class MenuPage extends StatefulWidget {
  const MenuPage ({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to the food item detail page
  void navigateToFoodDetails(int index){
    // get the shop and it's menu
    final shop= context.read<Shop>();
    final Foodmenu= shop.Foodmenu;
    Navigator.push(context, MaterialPageRoute(builder: (context) => 
    FoodDetailsPage(
      food: Foodmenu[index],
    ),));
  }
  @override
  Widget build(BuildContext context) {
    final shop= context.read<Shop>();
    final Foodmenu= shop.Foodmenu;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading:const Icon(
          Icons.menu,
        ),
          title:Center(
            child:const Text(
                "Tokyo",
              ),
          ),
            actions: [
              IconButton(onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              }, icon:const Icon(Icons.shopping_cart))
            ],
          ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // promo banner
            Container(
              decoration: BoxDecoration(
                color:primaryColor,
                borderRadius: BorderRadius.circular(20)
                ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      // promo message
                      Text("Get 32% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color:Colors.white
                      )),

                      const SizedBox(height: 20),

                      // Reedeem Button
                      MyButton(text: "Reedeem", 
                      onTap:() {
                        
                      },
                      )
                    ],
                  ),
                  
                  // image
                  Image.asset('lib/images/many_sushi.png',height: 100,)

                ],
              ),
            ),
            const SizedBox(height:25),
            // search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
               decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)
                ),hintText: "Search Here.."
               ),
              ),
            ),

            const SizedBox(height: 25),
            // menu list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: Text("Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:Colors.grey[800],
                fontSize: 18
              ),
             ),
              ),
              const SizedBox(height:10),
            // popular food

            Expanded(
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Foodmenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food:Foodmenu[index],
                  onTap: () => navigateToFoodDetails(index),
                ),
                ),
                ),
            const SizedBox(height: 25),

            // popular food
            Container(
              decoration: BoxDecoration(color:Colors.grey[100],
              borderRadius: BorderRadius.circular(20)
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom:25),
              padding: const EdgeInsets.all(20),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset('lib/images/salmon_egg.png',
                    height: 60,),

                    const SizedBox(width: 20),

                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Salmon Eggs",style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                      const SizedBox(height: 10),
                      
                      Text('\$21.00',style: TextStyle(color: Colors.grey[700]),),    
                      ],
                    ),
                  ],
                ),

                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,)
              ],),
            ),
          ],
        ),
    );
  }
}