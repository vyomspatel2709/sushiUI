import 'package:flutter/material.dart';
import 'package:sushiui/models/foods.dart';

class Shop extends ChangeNotifier{
   // food menu
 final List<Food> _Foodmenu=[
    // salmonsushi
    Food(name: "Salmon Sushi",
     price: "21.00",
      imagePath:"lib/images/salmon_sushi.png", 
      rating:"4.9"
      ),
    Food(name: "Tuna",
     price: "23.00",
      imagePath:"lib/images/tuna.png", 
      rating:"4.3"
      ),
  ];
  // customer cart
  List<Food> _cart=[];

  // getter method
  List<Food> get Foodmenu => _Foodmenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem,int quantity){
      for(int i=0;i<quantity;i++){
        _cart.add(foodItem);
      }
      notifyListeners();
  }
  // remove from cart
  void removeFromCart(Food  food){
    _cart.remove(food);
    notifyListeners();
  }
}