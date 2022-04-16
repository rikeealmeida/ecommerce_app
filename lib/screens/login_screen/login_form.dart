import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../widgets/text_field_container.dart';
import '../register_screen/register_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  // bool isButtonEnabled(LoginState state) {
  //   return state.isFormValid && isPopulated && !state.isSubmitting;
  // }



  @override
  void initState() {
    super.initState();
    // _loginBloc = BlocProvider.of<LoginBloc>(context);
    // _emailController.addListener(_onEmailChange);
    // _passwordController.addListener(_onPasswordChange);
  }

  @override
  Widget build(BuildContext context) {
    // return BlocListener<LoginBloc, LoginState>(
    //     listener: (context, state) {
    //       if (state.isFailure) {
    //         Scaffold.of(context)
    //           ..removeCurrentSnackBar()
    //           ..showSnackBar(
    //             SnackBar(
    //               content: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: const [
    //                   Text(
    //                     'Falha ao entrar!',
    //                     style: TextStyle(fontSize: 16),
    //                   ),
    //                   Icon(Icons.error)
    //                 ],
    //               ),
    //               backgroundColor: AppColors.secondaryColor.withOpacity(.8),
    //             ),
    //           );
    //       }
    //       if (state.isSubmitting) {
    //         Scaffold.of(context)
    //           ..removeCurrentSnackBar()
    //           ..showSnackBar(
    //             SnackBar(
    //               content: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: const [
    //                   Text(
    //                     'Entrando...',
    //                     style: TextStyle(fontSize: 16),
    //                   ),
    //                   CircularProgressIndicator()
    //                 ],
    //               ),
    //               backgroundColor: AppColors.secondaryColor.withOpacity(.8),
    //             ),
    //           );
    //       }
    //       if (state.isSuccess) {
    //         print(FirebaseAuth.instance.currentUser.email);
    //       }
    //     },
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 120),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: const Image(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Column(
              children: [
                RoundedInputContainer(
                  controller: _emailController,
                  // validator: (_) {
                  //   return !state.isEmailValid ? 'Email inválido!' : null;
                  // },
                  inputType: TextInputType.emailAddress,
                  obscure: false,
                  hintText: 'E-mail',
                  icon: Icons.person,
                  onChanged: (value) {
                    _emailController.text = value;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                RoundedPasswordField(
                  controller: _passwordController,
                  // validator: (_) {
                  //   return !state.isPasswordValid
                  //       ? 'Senha muito curta!'
                  //       : null;
                  // },
                  hint: 'Senha',
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    // if (isButtonEnabled(state)) {
                    //   _onFormSubmitted();
                    //   // if (FirebaseAuth.instance.currentUser != null) {
                    //   //   Navigator.pushReplacementNamed(context, '/home');
                    //   // } else {
                    //   //   return null;
                    //   // }
                    // }

                    print(FirebaseAuth.instance.currentUser);
                  },
                  child: const Text("Entrar"),
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.secondaryColor,
                      minimumSize: const Size(150, 35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60))),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Ainda não tem uma conta?",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return const RegisterScreen();
                          }));
                        },
                        child: const Text(
                          'Cadastre-se',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // void _onEmailChange() {
  //   _loginBloc.add(LoginEmailChange(email: _emailController.text));
  // }

  // void _onPasswordChange() {
  //   _loginBloc.add(LoginPasswordChanged(password: _passwordController.text));
  // }

  // void _onFormSubmitted() {
  //   _loginBloc.add(LoginWithCredentialsPressed(
  //       email: _emailController.text, password: _passwordController.text));
  // }
}
