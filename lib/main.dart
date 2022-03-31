import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecommerce/blocs/checkout/checkout_bloc.dart';
import 'package:flutter_ecommerce/blocs/product/product_bloc.dart';
import 'package:flutter_ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecommerce/blocs/wishlist/wishlist_event.dart';
import 'package:flutter_ecommerce/config/app_router.dart';
import 'package:flutter_ecommerce/repositories/category/category_repository.dart';
import 'package:flutter_ecommerce/repositories/checkout/checkout_repository.dart';
import 'package:flutter_ecommerce/repositories/product/product_repository.dart';
import 'package:flutter_ecommerce/screens/screens.dart';

import 'blocs/category/category_bloc.dart';
import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = BlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository())),
        BlocProvider(create: (_) => WishListBloc()..add(StartWishlist())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProducts()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Andressa Lima Boutique',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
