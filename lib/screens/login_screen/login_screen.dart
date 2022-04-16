import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/config/colors.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../home/home_screen.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login-screen';

  const LoginScreen({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthFailure) {
          return const LoginScreen();
        } else if (state is AuthSuccess) {
          return const HomeScreen();
        }
        print(state);

        return const Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: LoginForm(),
        );
      },
    );
  }
}
