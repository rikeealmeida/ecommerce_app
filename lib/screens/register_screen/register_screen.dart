import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/colors.dart';
import 'package:flutter_ecommerce/screens/register_screen/register_form.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register-screen';
  const RegisterScreen({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const RegisterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 50,
              ),
              Container(
                child: Image(
                  image: const AssetImage("assets/images/logo.png"),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Expanded(
            child: RegisterForm(),
          )
        ],
      ),
    );
  }
}
