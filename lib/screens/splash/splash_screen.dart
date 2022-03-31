import 'dart:async';

import 'package:flutter/material.dart';

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
      () => Navigator.popAndPushNamed(context, '/home'),
    );
    return Scaffold(
      body: Container(
        color: const Color(0xFFF8DBDD),
        child: const Center(
          child: Image(
            image: AssetImage("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}
