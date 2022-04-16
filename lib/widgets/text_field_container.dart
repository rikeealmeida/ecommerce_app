import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}

class RoundedInputContainer extends StatelessWidget {
  final Function(String) validator;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool obscure;
  final TextInputType inputType;
  const RoundedInputContainer({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.obscure,
    this.inputType,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autocorrect: false,
        autovalidateMode: AutovalidateMode.always,
        validator: validator,
        onChanged: onChanged,
        keyboardType: inputType,
        obscureText: obscure,
        decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(
              icon,
              color: AppColors.secondaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}

class RoundedPasswordField extends StatelessWidget {
  final Function(String) validator;
  final String hint;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.hint,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autocorrect: false,
        autovalidateMode: AutovalidateMode.always,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.lock,
              color: AppColors.secondaryColor,
            ),
            hintText: hint,
            border: InputBorder.none,
            suffixIcon: const Icon(
              Icons.visibility,
              color: AppColors.secondaryColor,
            )),
      ),
    );
  }
}
