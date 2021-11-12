import 'package:eshop/blocs/cart/cart_bloc.dart';
import 'package:eshop/blocs/category/category_bloc.dart';
import 'package:eshop/blocs/checkout/checkout_bloc.dart';
import 'package:eshop/blocs/product/product_bloc.dart';
import 'package:eshop/blocs/wishlist/wishlist_bloc.dart';
import 'package:eshop/blocs/wishlist/wishlist_event.dart';
import 'package:eshop/repositories/category/category_repository.dart';
import 'package:eshop/repositories/checkout/checkout_repository.dart';
import 'package:eshop/screens/cart/cart_screen.dart';
import 'package:eshop/screens/checkout/checkout_screen.dart';
import 'package:eshop/screens/home/home_screen.dart';
import 'package:eshop/screens/splash/splash_screen.dart';
import 'package:eshop/simple_bloc_observer.dart';
import 'package:eshop/widgets/custom_appbar.dart';
import 'package:eshop/widgets/custom_navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eshop/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/product/product_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();

  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (_) => CategoryBloc(categoryRepository: CategoryRepository())
            ..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(productRepository: ProductRepository())
            ..add(LoadProducts()),
        ),
        BlocProvider(
            create: (context) => CheckoutBloc(
                  cartBloc: context.read<CartBloc>(),
                  checkoutRepository: CheckoutRepository(),
                ))
      ],
      child: MaterialApp(
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
