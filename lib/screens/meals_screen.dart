import 'package:UniFit/components/appBar_component.dart';
import 'package:UniFit/components/meals_component.dart';
import 'package:UniFit/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(
          actionTextColor: Theme.of(context).backgroundColor,
          context: context,
          iconText: 'Voltar',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          title: 'Refeições',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MealsComponent(
                titleText: 'CAFÉ DA MANHÃ',
                imageLeftAsset: 'assets/images/Pão com Ovo.jpg',
                mealLeftName: 'PÃO COM OVO',
                imageRightAsset: 'assets/images/Tapioca.jpg',
                mealRightName: 'TAPIOCA',
              ),
              SizedBox(height: 5),
              MealsComponent(
                titleText: 'ALMOÇO',
                imageLeftAsset: 'assets/images/Baião de Dois.jpg',
                mealLeftName: 'BAIÃO DE DOIS',
                imageRightAsset: 'assets/images/Salada.png',
                mealRightName: 'SALADA',
              ),
              SizedBox(height: 5),
              MealsComponent(
                titleText: 'JANTA',
                imageLeftAsset: 'assets/images/Sopa de Abóbora.jpg',
                mealLeftName: 'SOPA DE ABÓBORA',
                imageRightAsset: 'assets/images/Sanduiche Natural.png',
                mealRightName: 'SANDUICHE NATURAL',
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
