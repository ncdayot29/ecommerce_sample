import 'package:ecommerce/models/Flower.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{

  List<Flower> flowerShop = [
    Flower(name: 'Crimson Elegance',
    price: '550',
    description: 'A romantic and timeless bouquet name reflecting the deep red roses and delicate white accents.',
    imagePath: 'lib/images/bouquet1.jpg',
    ),

    Flower(name: 'Blushing Elegance',
    price: '500',
    description: 'A romantic and refined arrangement perfect for love notes or heartfelt gestures.',
    imagePath: 'lib/images/bouquet2.jpg',
    ),

    Flower(name: 'Sunlit Serenity',
    price: '600',
    description: 'A cheerful and fresh bouquet evoking warmth, joy, and bright mornings.',
    imagePath: 'lib/images/bouquet3.jpg',
    ),

    Flower(name: 'Sunlight Symphony',
    price: '650',
    description: 'A cheerful burst of yellow and white blooms that captures the warmth and joy of a sunny day.',
    imagePath: 'lib/images/bouquet4.jpg',
    ),
  ];

  List<Flower> userCart = [];

  List<Flower> getFlowerList() {
    return flowerShop;
  }

  List<Flower> getUserCart() {
    return userCart;
  }

  void addItemToCart(Flower flower) {
    userCart.add(flower);
    notifyListeners();
  }

  void removeItemFromCart(Flower flower) {
    userCart.remove(flower);
    notifyListeners();
  }
}