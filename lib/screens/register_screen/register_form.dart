import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../widgets/text_field_container.dart';

class RegisterForm extends StatefulWidget {
  // Map<String, dynamic> userData;
  const RegisterForm({Key key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  // bool isButtonEnabled(RegisterState state) {
  //   return state.isFormValid && isPopulated && !state.isSubmitting;
  // }

  @override
  void initState() {
    super.initState();
    // _registerBloc = BlocProvider.of<RegisterBloc>(context);

    // _emailController.addListener(_onRegisterEmailChange);
    // _firstNameController.addListener(_onRegisterFirstNameChange);
    // _lastNameController.addListener(_onRegisterLastNameChange);
    // _phoneController.addListener(_onRegisterPhoneChange);
    // _passwordController.addListener(_onRegisterPasswordChange);
  }

  @override
  Widget build(BuildContext context) {
    // return BlocListener<RegisterBloc, RegisterState>(
    //   listener: (context, state) {
    //     if (state.isFailure) {
    //       Scaffold.of(context)
    //         ..removeCurrentSnackBar()
    //         ..showSnackBar(
    //           SnackBar(
    //             content: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: const [
    //                 Text(
    //                   'Falha ao Registrar!',
    //                   style: TextStyle(fontSize: 16),
    //                 ),
    //                 Icon(Icons.error)
    //               ],
    //             ),
    //             backgroundColor: AppColors.secondaryColor,
    //           ),
    //         );
    //     }
    //     if (state.isSubmitting) {
    //       Scaffold.of(context)
    //         ..removeCurrentSnackBar()
    //         ..showSnackBar(
    //           SnackBar(
    //             content: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: const [
    //                 Text(
    //                   'Registrando...',
    //                   style: TextStyle(fontSize: 16),
    //                 ),
    //                 CircularProgressIndicator()
    //               ],
    //             ),
    //             backgroundColor: AppColors.secondaryColor,
    //           ),
    //         );
    //     }
    //     if (state.isSuccess) {
    //       print(FirebaseAuth.instance.currentUser.email);
    //     }
    //   },

    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RoundedInputContainer(
                    // validator: (_) {
                    //   return !state.isEmailValid ? 'Email inválido!' : null;
                    // },
                    controller: _emailController,
                    inputType: TextInputType.emailAddress,
                    obscure: false,
                    hintText: 'E-mail',
                    icon: Icons.person,
                    onChanged: (value) {
                      _emailController.text = value;
                      // context.read<SignupCubit>().emailChanged(value);
                    },
                  ),
                  RoundedInputContainer(
                    // validator: (_) {
                    //   return !state.isFirstNameValid
                    //       ? 'Nome obrigatório!'
                    //       : null;
                    // },
                    controller: _firstNameController,
                    obscure: false,
                    hintText: 'Primeiro nome',
                    icon: Icons.person,
                    onChanged: (value) {
                      _firstNameController.text = value;
                      // context.read<SignupCubit>().firstNameChanged(value);
                    },
                  ),
                  RoundedInputContainer(
                    // validator: (_) {
                    //   return !state.isLastNameValid
                    //       ? 'Sobrenome obrigatório!'
                    //       : null;
                    // },
                    controller: _lastNameController,
                    obscure: false,
                    hintText: 'Segundo nome',
                    icon: Icons.person,
                    onChanged: (value) {
                      _lastNameController.text = value;
                      // context.read<SignupCubit>().lastNameChanged(value);
                    },
                  ),
                  RoundedInputContainer(
                    // validator: (_) {
                    //   return !state.isPhoneValid
                    //       ? 'Formato de telefone inválido!'
                    //       : null;
                    // },
                    controller: _phoneController,
                    inputType: TextInputType.number,
                    obscure: false,
                    hintText: 'Número de telefone',
                    icon: Icons.phone,
                    onChanged: (value) {
                      _phoneController.text = value;
                      // context.read<SignupCubit>().phoneChanged(value);
                    },
                  ),
                  RoundedPasswordField(
                    // validator: (_) {
                    //   return !state.isPasswordValid ? 'Senha inválida!' : null;
                    // },
                    controller: _passwordController,
                    hint: 'Senha',
                    onChanged: (value) {
                      // context.read<SignupCubit>().passwordChanged(value);
                    },
                  ),
                  RoundedPasswordField(
                    validator: (_) {},
                    hint: 'Confirme a Senha',
                    onChanged: (value) {
                      // context.read<SignupCubit>().confirmpasswordChanged(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              ElevatedButton(
                onPressed:
                    // isButtonEnabled(state)
                    //     ?
                    () {
                  // widget.userData = {
                  //   'email': _emailController.text,
                  //   'firstName': _firstNameController.text,
                  //   'lastName': _lastNameController.text,
                  //   'phone': _phoneController.text,
                  // };

                  // _onRegisterFormSubmitted();
                  // context
                  //     .read<SignupCubit>()
                  //     .signupWithCredentials(_onSuccess, _onFail);
                  // await Navigator.pushReplacementNamed(context, '/home');
                },
                // : null,
                child: const Text("Registrar"),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.secondaryColor,
                    minimumSize: const Size(150, 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Já tem uma conta? ",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login-screen');
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // void _onRegisterEmailChange() {
  //   _registerBloc.add(RegisterEmailChanged(email: _emailController.text));
  // }

  // void _onRegisterFirstNameChange() {
  //   _registerBloc
  //       .add(RegisterFirstNameChanged(firstName: _firstNameController.text));
  // }

  // void _onRegisterLastNameChange() {
  //   _registerBloc
  //       .add(RegisterLastNameChanged(lastName: _lastNameController.text));
  // }

  // void _onRegisterPhoneChange() {
  //   _registerBloc.add(RegisterPhoneChanged(phone: _phoneController.text));
  // }

  // void _onRegisterPasswordChange() {
  //   _registerBloc
  //       .add(RegisterPasswordChanged(password: _passwordController.text));
  // }

  // void _onRegisterFormSubmitted() {
  //   _registerBloc.add(
  //     RegisterWithCredentialsPressed(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     ),
  //   );
  // }
}
