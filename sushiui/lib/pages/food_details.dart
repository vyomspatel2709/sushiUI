import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushiui/components/button.dart';
import 'package:sushiui/models/foods.dart';
import 'package:sushiui/models/shop.dart';
import 'package:sushiui/themes/color.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({
    super.key,
    required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount=0;

  void decrementQuantity(){
    setState(() {
      if(quantityCount>0){
      quantityCount--;
      }
    });
  }

  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }

  void addToCart(){
    // only add to cart if there is something in the cart
    if(quantityCount>0){
      //get access to the cart
      final shop= context.read<Shop>();
      
      // add to cart
      shop.addToCart(widget.food, quantityCount);

      // let the user know it was successful
      showDialog(context: context,
      barrierDismissible: false,
       builder:(context) => AlertDialog(
        backgroundColor: primaryColor,
        content: Text("Successfully added to cart",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,),
        actions: [
          // okay button
          IconButton(onPressed:() { 
            // pop to remove dialog box
            Navigator.pop(context); 
            // pop agian to go to the previous screen
            Navigator.pop(context);
          }, icon:const Icon(Icons.done,color:Colors.white))
        ],
       ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // listview of the food detail
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
              children: [
                // image
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),
                const SizedBox(height: 10),
                // rating
                Row(
                  children: [
                    // star icon
                    Icon(Icons.star,
                    color: Colors.yellow[800],
                    ),
                  const SizedBox(width: 5),
            
                  const SizedBox(height: 10),
            
                  Text(widget.food.rating,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    ),
                    )
                  ],
                ),

                const SizedBox(height:10),
                // food name
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                const SizedBox(height:25),
                // Description
                Text(
                  "Description",
                style: TextStyle(
                  color:Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                  ),
                  ),
                const SizedBox(height: 10),

                Text("Delicates slices fresh salmon drapes elegantlty over a pillow of perfectly seasoned sushi rice.Its vibrant hue and buttery texture promise an axquisite melt-in-your mouth experience.Paired with a whisper of wasabi and a side of traditional pickle ginger,our salmon sushi is an ode to the purity and simplicity of authentic japanese flavours. ",
                style: TextStyle(
                  color:Colors.grey[600],
                  fontSize: 14,
                  height: 2
                  ),
                )
              ],
             ),
            )
          ),
          // price+quantity+add to cart button
          Container(
            color: primaryColor,
            padding:const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // price+quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(
                      "\$"+ widget.food.price,
                      style:const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),
                    // quantity
                    Row(children: [
                      // minus button
                      Container(
                        decoration:BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle
                          ),
                        child: IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white),
                            onPressed: decrementQuantity,
                            ),
                      ),
                      // quantity button
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text( quantityCount.toString(),
                          style:const TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                            ),
                          ),
                        ),
                      ),
                      // plus button
                       Container(
                        decoration:BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle
                          ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white),
                            onPressed: incrementQuantity,
                            ),
                      )
                    ],)
                  ],
                ),

                const SizedBox(height:25),
                // add to cart button
                MyButton(text:"Add To Cart", onTap: addToCart)
              ],
            ),
          )
        ],
      ),
    );
  }
}