import 'package:UniFit/components/appBar_component.dart';
import 'package:UniFit/components/button_component.dart';
import 'package:UniFit/data/user_data.dart';
import 'package:UniFit/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../components/TextField_component.dart';
import '../data/userList_data.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _nameFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final _confirmPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenAvaliableWidth = MediaQuery.of(context).size.width;
    final double screenAvaliableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    double textScaleFactor = (MediaQuery.of(context).textScaleFactor * 0 + 1);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(
            actionTextColor: Color.fromRGBO(93, 176, 117, 1),
            context: context,
            iconText: 'Voltar',
            title: 'Cadastrar',
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
                formKey: _nameFormKey,
                erroEmptyTextField: 'Por favor, insira seu nome',
                controller: nomeController,
                hintText: 'Nome',
                keyboardType: TextInputType.name,
              ),
              ComponentTextField(
                width: screenAvaliableWidth * 0.95,
                formKey: _emailFormKey,
                erroEmptyTextField: 'Por favor, insira um email',
                erroInvalidText: 'Email inválido.',
                erroUsedText: 'Email já cadastrado',
                controller: emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              Container(
                height: 50,
                width: screenAvaliableWidth * 0.95,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.only(left: 19),
                margin: const EdgeInsets.all(10),
                child: Form(
                  key: _passwordFormKey,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    cursorColor: Theme.of(context).backgroundColor,
                    style: TextStyle(
                      fontSize: 20 * textScaleFactor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16 *
                            (MediaQuery.of(context).textScaleFactor * 0 + 1),
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(189, 189, 189, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: screenAvaliableWidth * 0.95,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.only(left: 19),
                margin: const EdgeInsets.all(10),
                child: Form(
                  key: _confirmPasswordFormKey,
                  child: TextFormField(
                    controller: confirmPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, insira a senha de confirmação';
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        return 'As senhas não são iguais.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    cursorColor: Theme.of(context).backgroundColor,
                    style: TextStyle(
                      fontSize: 20 * textScaleFactor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Confirmar Senha',
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16 *
                            (MediaQuery.of(context).textScaleFactor * 0 + 1),
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(189, 189, 189, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenAvaliableHeight * 0.030,
              ),
              ButtonComponent(
                  onPressed: () {
                    if (!_nameFormKey.currentState.validate() ||
                        !_emailFormKey.currentState.validate() ||
                        !_passwordFormKey.currentState.validate() ||
                        !_confirmPasswordFormKey.currentState.validate()) {
                      return true;
                    }

                    UserData newUser = UserData(
                      name: nomeController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      calories: '0',
                      water: '0',
                    );
                    userList.add(newUser);
                    userList.forEach((element) {});
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                    return true;
                  },
                  backgroundColor: Theme.of(context).backgroundColor,
                  height: 51,
                  width: screenAvaliableWidth * 0.95,
                  text: 'Cadastrar',
                  textColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
