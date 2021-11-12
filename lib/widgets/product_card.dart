import 'package:eshop/blocs/cart/cart_bloc.dart';
import 'package:eshop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double withFactor;
  final double leftPosition;
  final bool isWishlist;
  ProductCard(
      {this.leftPosition = 5,
      this.withFactor = 2.5,
      required this.product,
      this.isWishlist = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
        // Navigator.of(context).pushNamed(
        //   '/product',
        //   arguments: product,
        // );
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width / 2.5,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 60,
              left: leftPosition,
              child: Container(
                height: 80,
                width:
                    MediaQuery.of(context).size.width / 2.5 - 10 - leftPosition,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              )),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
                height: 70,
                width:
                    MediaQuery.of(context).size.width / 2.5 - 20 - leftPosition,
                decoration: BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${product.price}',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoading)
                            return CircularProgressIndicator();
                          else if (state is CartLoaded) {
                            return Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(CartProductAdded(product));
                                    final snackBar = SnackBar(
                                        content: Text('Added to your Cart!',
                                            style: TextStyle(
                                                color: Colors.green)));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  icon: Icon(Icons.add_circle,
                                      color: Colors.green)),
                            );
                          } else
                            return Text("something went wrong");
                        },
                      ),
                      isWishlist
                          ? Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete, color: Colors.red)),
                            )
                          : SizedBox(),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
