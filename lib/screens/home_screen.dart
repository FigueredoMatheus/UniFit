import 'package:UniFit/components/alertDialog_component.dart';
import 'package:UniFit/components/appBar_component.dart';
import 'package:UniFit/screens/imc_tmb_screen.dart';
import 'package:UniFit/screens/login_screen.dart';
import 'package:UniFit/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import '../components/homeCard_component.dart';
import 'fatColories_screen.dart';
import 'meals_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget scaffoldAppBar = appBar(
      actionTextColor: Color.fromRGBO(93, 176, 117, 1),
      context: context,
      iconText: 'Sair',
      onPressed: () {
        showDialog(context: context, builder: (_) => AlertDialogComponent());
      },
      title: 'UniFit',
    );

    return SafeArea(
      child: Scaffold(
        appBar: scaffoldAppBar,
        body: Column(children: [
          CardComponent(
              appBarSize: appBarSize(scaffoldAppBar),
              title: 'Meu Perfil',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              }),
          CardComponent(
            title: 'Calculadora de IMC & TMB',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImcTmbScreen(),
                ),
              );
            },
          ),
          CardComponent(
            title: 'Calculadora de Gordura e Calorias',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FatCaloriesScreen(),
                ),
              );
            },
          ),
          CardComponent(
            title: 'Refeições',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MealsScreen(),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
