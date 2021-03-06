// ignore_for_file: no_duplicate_case_values

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/models.dart';
import 'package:flutter_ecommerce/screens/login_screen/login_screen.dart';
import 'package:flutter_ecommerce/screens/order_confirmation_screen/order_confirmation_screen.dart';
import 'package:flutter_ecommerce/screens/register_screen/register_screen.dart';

import '../screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case RegisterScreen.routeName:
        return RegisterScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishList.routeName:
        return WishList.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case OrderConfirmation.routeName:
        return OrderConfirmation.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
      ),
    );
  }
}
