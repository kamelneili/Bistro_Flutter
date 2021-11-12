import 'package:eshop/models/product_model.dart';
import 'package:eshop/screens/cart/cart_screen.dart';
import 'package:eshop/screens/checkout/checkout_screen.dart';
import 'package:eshop/screens/home/home_screen.dart';
import 'package:eshop/screens/product/product_screen.dart';
import 'package:eshop/screens/splash/splash_screen.dart';
import 'package:eshop/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case '/checkout':
        return MaterialPageRoute(
          builder: (_) => CheckoutScreen(),
        );
      case '/product':
        return MaterialPageRoute(
          builder: (_) => ProductScreen(product: settings.arguments as Product),
        );
      case '/wishlist':
        return MaterialPageRoute(
          builder: (_) => WishlistScreen(),
        );
      case '/cart':
        return MaterialPageRoute(
          builder: (_) => CartScreen(),
        );
    }
  }
}
