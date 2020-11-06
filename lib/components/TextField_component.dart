import 'package:UniFit/data/userList_data.dart';
import 'package:flutter/material.dart';

class ComponentTextField extends StatelessWidget {
  final String hintText;
  final String erroEmptyTextField;
  final String erroUsedText;
  final String erroInvalidText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final String password;
  final double borderRadius;
  final double width;

  ComponentTextField({
    @required this.width,
    this.password,
    this.hintText,
    this.erroEmptyTextField,
    this.erroUsedText,
    this.erroInvalidText,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.formKey,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color.fromRGBO(232, 232, 232, 1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return erroEmptyTextField;
            } else if (erroUsedText != null &&
                userList.any((element) => element.email == value)) {
              return erroUsedText;
            } else if ((!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value) &&
                    erroInvalidText != null) ||
                (password != null && value != password)) {
              return erroInvalidText;
            }

            return null;
          },
          keyboardType: keyboardType,
          autocorrect: true,
          obscureText: obscureText,
          cursorColor: Theme.of(context).backgroundColor,
          style: TextStyle(
            fontSize: 20,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(189, 189, 189, 1),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
