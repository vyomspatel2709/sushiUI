import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiui/components/button.dart';
import 'package:sushiui/models/foods.dart';
import 'package:sushiui/models/shop.dart';
import 'package:sushiui/themes/color.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context){
    final shop =context.read<Shop>();
  
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context,value,child)=>Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title:const Text("My Cart"),
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:value.cart.length,
                itemBuilder:(context,index) {
                 // get food from cart
                  final Food food=value.cart[index];
                 // get food name
                 final String Foodname=food.name;
                 //get food price
                 final String Foodprice=food.price;
                 
                 // return list tile
                 return Container(
                  decoration: BoxDecoration(color: secondaryColor,
                  borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.only(left: 20,top: 20,right: 20),
                   child: ListTile(
                    title: Text(Foodname,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    subtitle: Text(Foodprice,style: TextStyle(color: Colors.grey[200],fontWeight: FontWeight.bold)),
                    trailing: IconButton(icon: Icon(Icons.delete,color: Colors.grey[300],),
                    onPressed:() => removeFromCart(food,context )),
                   ),
                 );
                
                }
                ),
            ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(text: "Pay Now", onTap: () {
                  
                },),
              )
          ],
        ),
      ),
    );
  }
}