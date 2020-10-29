import 'package:UniFit/components/button_component.dart';
import 'package:UniFit/models/user_model.dart';
import 'package:UniFit/screens/SignUp_screen.dart';
import 'package:UniFit/screens/home_screen.dart';
import 'package:UniFit/screens/resetPassword_screen.dart';
import 'package:flutter/material.dart';
import '../components/TextField_component.dart';
import '../data/userList_data.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  int _userListIndex;

  bool validateUser() {
    _userListIndex =
        userList.indexWhere((element) => element.email == emailController.text);

    if (_userListIndex != -1) {
      return userList[_userListIndex].password == passwordController.text;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final double screenAvaliableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    final double screenAvaliableWidth = MediaQuery.of(context).size.width;

    print('Height: $screenAvaliableHeight');
    print('Width: $screenAvaliableWidth');

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                width: screenAvaliableWidth,
                height: screenAvaliableHeight * 0.37,
                child: Image.asset(
                  'assets/images/Logo.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Center(
                child: Text(
                  'UniFit',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize:
                        50 * (MediaQuery.of(context).textScaleFactor * 0 + 1),
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              ComponentTextField(
                width: screenAvaliableWidth * 0.95,
                formKey: _emailFormKey,
                controller: emailController,
                hintText: 'Email',
                erroEmptyTextField: 'Por favor, insira seu email.',
                keyboardType: TextInputType.emailAddress,
              ),
              ComponentTextField(
                width: screenAvaliableWidth * 0.95,
                controller: passwordController,
                formKey: _passwordFormKey,
                hintText: 'Senha',
                erroEmptyTextField: 'Por favor, insira sua senha.',
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              ButtonComponent(
                text: 'Entrar',
                textColor: Colors.white,
                snackbarText: 'Senha ou e-mail incorretos, tente novamente.',
                height: 51,
                width: screenAvaliableWidth * 0.31,
                backgroundColor: Theme.of(context).backgroundColor,
                onPressed: () {
                  if (!_emailFormKey.currentState.validate() ||
                      !_passwordFormKey.currentState.validate()) {
                    return true;
                  }

                  if (validateUser()) {
                    LoggedUser user = LoggedUser();
                    user.login(userData: userList[_userListIndex]);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                    return true;
                  }

                  return false;
                },
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  'Esqueceu a Senha?',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Theme.of(context).backgroundColor,
                      fontSize:
                          16 * (MediaQuery.of(context).textScaleFactor * 0 + 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              ButtonComponent(
                backgroundColor: Colors.white,
                textColor: Theme.of(context).backgroundColor,
                text: 'Cadastrar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                height: 51,
                width: screenAvaliableWidth * 0.95,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
