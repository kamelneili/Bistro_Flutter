import 'package:eshop/blocs/wishlist/wishlist_bloc.dart';
import 'package:eshop/blocs/wishlist/wishlist_state.dart';
import 'package:eshop/models/product_model.dart';
import 'package:eshop/widgets/custom_appbar.dart';
import 'package:eshop/widgets/custom_navbar.dart';
import 'package:eshop/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
        if (state is WishlistLoading)
          return Center(child: CircularProgressIndicator());
        else if (state is WishlistLoaded) {
          return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2.2),
              itemCount: state.wishlist.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ProductCard(
                      product: state.wishlist.products[index],
                      withFactor: 1.1,
                      // leftPosition: 20,
                      isWishlist: true),
                );
              });
        } else
          return Text('something went wrong');
      }),
    );
  }
}
