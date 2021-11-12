import 'package:equatable/equatable.dart';
import 'package:eshop/models/product_model.dart';
import 'package:flutter/material.dart';

class Cart extends Equatable {
  final List<Product> products;
  Map productQuantity(products) {
    var quantity = Map();
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  const Cart({this.products = const <Product>[]});
  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);
  String get subtotalString => subtotal.toStringAsFixed(2);
  double deliveryFee(subtotal) {
    if (subtotal >= 30) {
      return 0.0;
    } else
      return 10.0;
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String freeDelivery(subtotal) {
    if (subtotal >= 30) {
      return 'You have Free delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  String get freeDeliveryString => freeDelivery(subtotal);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
