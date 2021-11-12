import 'package:equatable/equatable.dart';
import 'package:eshop/models/product_model.dart';
import 'package:flutter/material.dart';

class Wishlist extends Equatable {
  final List<Product> products;

  const Wishlist({
    this.products = const <Product>[],
  });
  @override
  List<Object?> get props => [
        products,
      ];
}
