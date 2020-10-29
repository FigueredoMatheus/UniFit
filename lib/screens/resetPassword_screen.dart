import 'package:UniFit/components/TextField_component.dart';
import 'package:UniFit/components/appBar_component.dart';
import 'package:UniFit/components/button_component.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenAvaliableWidth = MediaQuery.of(context).size.width;
    final double screenAvaliableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return SafeArea(
      child: Scaffold(
        appBar: appBar(
            actionTextColor: Color.fromRGBO(93, 176, 117, 1),
            context: context,
            iconText: 'Voltar',
            title: 'Recuperar Senha',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            }),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ComponentTextField(
                width: screenAvaliableWidth * 0.95,
                formKey: _emailFormKey,
                erroEmptyTextField: "Por favor, insira um email",
                erroInvalidText: 'Email inválido.',
                controller: _emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 15,
              ),
              ButtonComponent(
                onPressed: () {
                  if (!_emailFormKey.currentState.validate()) {
                    return true;
                  }
                  return false;
                },
                snackbarText: 'e-mail de recuperação enviado',
                backgroundColor: Theme.of(context).backgroundColor,
                height: 51,
                width: screenAvaliableWidth * 0.95,
                text: 'Recuperar',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
