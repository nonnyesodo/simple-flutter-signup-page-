import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final hintext;
  final labeltext;
  final icon;
  final bool obscure;
  final suficon;
  final validator;
  final onchange;

  const Textfield({
    required this.hintext,
    required this.labeltext,
    Key? key,
    this.icon,
    required this.obscure,
    this.suficon,
    this.onchange,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onchange,
      onFieldSubmitted: (value) {},
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hintext,
        labelText: labeltext,
        labelStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
        prefixIcon: icon,
        suffixIcon: suficon,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        //  border: const UnderlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red),
        // ),
      ),
    );
  }
}
