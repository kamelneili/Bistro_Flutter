import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop/blocs/cart/cart_bloc.dart';
import 'package:eshop/blocs/wishlist/wishlist_bloc.dart';
import 'package:eshop/blocs/wishlist/wishlist_event.dart';
import 'package:eshop/blocs/wishlist/wishlist_state.dart';
import 'package:eshop/models/category_model.dart';
import 'package:eshop/models/product_model.dart';
import 'package:eshop/widgets/custom_appbar.dart';
import 'package:eshop/widgets/custom_navbar.dart';
import 'package:eshop/widgets/hero_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: product.name),
        bottomNavigationBar: BottomAppBar(
            color: Colors.black,
            child: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.white),
                      onPressed: () {},
                    ),
                    BlocBuilder<WishlistBloc, WishlistState>(
                        builder: (context, state) {
                      return IconButton(
                        icon: Icon(Icons.favorite, color: Colors.white),
                        onPressed: () {
                          context
                              .read<WishlistBloc>()
                              .add(AddWishlistProduct(product));
                          final snackBar = SnackBar(
                              content: Text('Added to your Wishlist!',
                                  style: TextStyle(color: Colors.pinkAccent)));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      );
                    }),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(product));
                              Navigator.pushNamed(context, '/cart');
                            },
                            child: Text(
                              'Add To CART',
                            ));
                      },
                    )
                  ],
                ))),
        body: ListView(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  initialPage: 2,
                ),
                items: [HeroCarouselCard(product: product)]),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        alignment: Alignment.bottomCenter,
                        color: Colors.black.withAlpha(50)),
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        width: MediaQuery.of(context).size.width - 10,
                        height: 50,
                        alignment: Alignment.bottomCenter,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(product.name,
                                  style: TextStyle(color: Colors.white)),
                              Text('\$${product.price}',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        )),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ExpansionTile(
                title: Text('Product Information'),
                children: [
                  ListTile(
                    title: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ExpansionTile(
                title: Text('Delivery Information'),
                children: [
                  ListTile(
                    title: Text(
                        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
