import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop/blocs/category/category_bloc.dart';
import 'package:eshop/blocs/product/product_bloc.dart';
import 'package:eshop/models/category_model.dart';
import 'package:eshop/models/product_model.dart';
import 'package:eshop/widgets/custom_appbar.dart';
import 'package:eshop/widgets/custom_navbar.dart';
import 'package:eshop/widgets/hero_carousel_card.dart';
import 'package:eshop/widgets/product_card.dart';
import 'package:eshop/widgets/product_carousel.dart';
import 'package:eshop/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Bistro'),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(child: CircularProgressIndicator());
                  //   child: Text('circularindic'));
                } else if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      initialPage: 2,
                    ),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  );
                } else
                  return Text("something went wrong");
              },
            )),
            SectionTitle(title: "Recommended"),
            //  ProductCard(product: Product.products[0]),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.products
                          .where((product) => product.isRecommended)
                          .toList());
                } else
                  return Text("something went wrong");
              },
            ),

            SectionTitle(title: "Most Popular"),
            //  ProductCard(product: Product.products[0]),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.products
                          .where((product) => product.isPopular)
                          .toList());
                } else
                  return Text("something went wrong");
              },
            ),
          ],
        ),
      ),
    );
  }
}
