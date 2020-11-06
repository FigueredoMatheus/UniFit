import 'package:UniFit/components/activityFactorGrid_component.dart';
import 'package:UniFit/components/appBar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'home_screen.dart';

class FatCaloriesScreen extends StatefulWidget {
  @override
  _FatCaloriesScreenState createState() => _FatCaloriesScreenState();
}

class _FatCaloriesScreenState extends State<FatCaloriesScreen> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _cinturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _pescocoController = TextEditingController();
  final TextEditingController _quadrilController = TextEditingController();
  final _alturaFormKey = GlobalKey<FormState>();
  final _pesoFormKey = GlobalKey<FormState>();
  final _cinturaFormKey = GlobalKey<FormState>();
  final _pescocoFormKey = GlobalKey<FormState>();
  final _quadrilFormKey = GlobalKey<FormState>();
  int radioParent = 0;
  int radioSex = 0;
  double fat = 0;
  double caloriesRecommended = 0;

  @override
  Widget build(BuildContext context) {
    callback(int radioChild) {
      radioParent = radioChild;
    }

    _setState() {
      setState(() {});
    }

    double fatPercentageValue() {
      double value = 0;
      double quadril = double.parse(_quadrilController.text);
      double pescoco = double.parse(_pescocoController.text);
      double altura = double.parse(_alturaController.text);
      double cintura = double.parse(_cinturaController.text);

      value = (quadril / altura) * sqrt(altura) + log(cintura * pescoco);
      if (value < 0) {
        value = -value;
      }
      return value;
    }

    double caloriesRecommendedValue() {
      double altura = double.parse(_alturaController.text);
      double peso = double.parse(_pesoController.text);
      double value = 0;

      value = sqrt(altura * peso) * fat + 800;
      value = value - (500 - (radioParent * 100));

      return value;
    }

    final double screenAvaliableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    final double screenAvaliableWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(
          context: context,
          iconText: 'Voltar',
          title: 'Gorduras & Cal.',
          titleTextColor: Colors.black,
          backgroundColor: Colors.white,
          actionTextColor: Theme.of(context).backgroundColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Container(
                height: 50,
                width: screenAvaliableWidth * 0.952,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    borderRadius: BorderRadius.circular(100)),
                padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                margin: const EdgeInsets.only(bottom: 8),
                child: Form(
                  key: _alturaFormKey,
                  child: TextFormField(
                    controller: _alturaController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, insira sua altura.';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    cursorColor: Theme.of(context).backgroundColor,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Altura cm',
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
                width: screenAvaliableWidth * 0.952,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    borderRadius: BorderRadius.circular(100)),
                padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                margin: const EdgeInsets.only(bottom: 8),
                child: Form(
                  key: _pesoFormKey,
                  child: TextFormField(
                    controller: _pesoController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, insira seu peso.';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    cursorColor: Theme.of(context).backgroundColor,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Peso Kg',
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
                width: screenAvaliableWidth * 0.952,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    borderRadius: BorderRadius.circular(100)),
                padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                margin: const EdgeInsets.only(bottom: 8),
                child: Form(
                  key: _cinturaFormKey,
                  child: TextFormField(
                    controller: _cinturaController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, insira a largura de sua cintura.';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    cursorColor: Theme.of(context).backgroundColor,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Cintura cm',
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
                width: screenAvaliableWidth * 0.952,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    borderRadius: BorderRadius.circular(100)),
                padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                margin: const EdgeInsets.only(bottom: 8),
                child: Form(
                  key: _pescocoFormKey,
                  child: TextFormField(
                    controller: _pescocoController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, insira a largura de seu pescoço.';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    cursorColor: Theme.of(context).backgroundColor,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Pescoço cm',
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
                width: screenAvaliableWidth * 0.952,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    borderRadius: BorderRadius.circular(100)),
                padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                margin: const EdgeInsets.only(bottom: 8),
                child: Form(
                  key: _quadrilFormKey,
                  child: TextFormField(
                    controller: _quadrilController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, insira a largura de seu quadril.';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    cursorColor: Theme.of(context).backgroundColor,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Quadril cm',
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
              Text(
                'Fator de Atividade',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              ActivityFactorGrid(callBack: callback, setState: _setState),
              Container(
                height: 50,
                width: screenAvaliableWidth * 0.952,
                child: RaisedButton(
                  onPressed: () {
                    if (_alturaFormKey.currentState.validate() &&
                        _pesoFormKey.currentState.validate() &&
                        _cinturaFormKey.currentState.validate() &&
                        _pescocoFormKey.currentState.validate() &&
                        _quadrilFormKey.currentState.validate()) {
                      setState(() {
                        fat = fatPercentageValue();
                        caloriesRecommended = caloriesRecommendedValue();
                      });
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                      side:
                          BorderSide(color: Theme.of(context).backgroundColor)),
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  color: Theme.of(context).backgroundColor,
                  elevation: 0,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'Calorias recomendadas:',
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  width: screenAvaliableWidth * 0.3,
                  height: screenAvaliableHeight * 0.06,
                  child: FittedBox(
                    child: Column(
                      children: [
                        Text(
                          caloriesRecommended.toStringAsFixed(2),
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Text(
                          'Kcal dia',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(153, 153, 153, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Percentual de gordura:',
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: screenAvaliableWidth * 0.3,
                  height: screenAvaliableHeight * 0.04,
                  child: FittedBox(
                    child: Column(
                      children: [
                        Text(
                          '${fat.toStringAsFixed(0)}%',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
