import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(
        seconds: 2,
      ),
      () => Navigator.popAndPushNamed(
        context,
        '/login-screen',
      ),
    );

    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: const Center(
          child: Image(
            image: AssetImage("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}
