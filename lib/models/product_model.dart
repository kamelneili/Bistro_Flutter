import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  // final int id;
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  final bool isPopular;
  final bool isRecommended;

  Product({
    //  required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isRecommended,
    required this.category,
  });
  @override
  List<Object?> get props => [
        //  id,
        name,
        imageUrl,
        price,
        isRecommended,
        isPopular,
        category,
      ];
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      //  id: snap['id'],
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isPopular: snap['isPopular'],
      isRecommended: snap['isRecommended'],
      category: snap['category'],
    );
    print(product);
    return product;
  }

  static List<Product> products = [
    Product(
      // id: 1,
      category: 'Pizza',
      name: 'Pizza',
      isPopular: true,
      isRecommended: true,
      price: 2.99,
      imageUrl:
          'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', // tags: ['Italian', 'Dessert', 'Ice Cream'],
    ),
    Product(
      //  id: 2,
      name: 'Burger',
      isPopular: true,
      isRecommended: true,
      price: 2.99,
      category: 'Burger',
      imageUrl:
          'https://images.unsplash.com/photo-1634046387041-db02e878d22b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80',
    ),
    Product(
      //   id: 3,
      name: 'Salad',
      isPopular: true,
      isRecommended: true,
      price: 2.99,
      category: 'Salad',
      imageUrl:
          'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', // tags: ['Italian', 'Dessert', 'Ice Cream'],
    ),
    Product(
      //   id: 4,
      name: 'Desser',
      isPopular: true,
      isRecommended: true,
      price: 2.99,
      category: 'Dessert',
      imageUrl:
          'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', // tags: ['Italian', 'Dessert', 'Ice Cream'],
    ),
    Product(
      // id: 5,
      name: 'Drink',
      isPopular: true,
      isRecommended: true,
      price: 2.99,
      category: 'Drink',
      imageUrl:
          'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', // tags: ['Italian', 'Dessert', 'Ice Cream'],
    ),
  ];
}
