import 'package:UniFit/components/activityFactorGrid_component.dart';
import 'package:UniFit/components/appBar_component.dart';
import 'package:UniFit/components/chart_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';

class ImcTmbScreen extends StatefulWidget {
  @override
  _ImcTmbScreenState createState() => _ImcTmbScreenState();
}

class _ImcTmbScreenState extends State<ImcTmbScreen> {
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final _pesoFormKey = GlobalKey<FormState>();
  final _idadeFormKey = GlobalKey<FormState>();
  final _alturaFormKey = GlobalKey<FormState>();
  int radioParent = 0;
  int radioSex = 0;
  List<String> sexList = ['Masculino', 'Feminino'];
  double _tmbValue = 0.0;
  double _imcValue = 0.0;
  String chartStatus = '';

  callback(int radioChild) {
    radioParent = radioChild;
  }

  _setState() {
    setState(() {});
  }

  double tmbCalculador() {
    double value = 0;

    if (radioSex == 0) {
      value = 66 +
          (13.8 * double.parse(_pesoController.text)) +
          (5 * double.parse(_alturaController.text)) -
          (6.8 * double.parse(_idadeController.text));
    } else {
      value = 655 +
          (9.6 * double.parse(_pesoController.text)) +
          (1.8 * double.parse(_alturaController.text)) -
          (4.7 * double.parse(_idadeController.text));
    }
    value = value + (radioParent * 100);
    return value;
  }

  double imcCalculator() {
    double value = 0;

    value = double.parse(_pesoController.text) /
        (double.parse(_alturaController.text) /
            100 *
            double.parse(_alturaController.text) /
            100);
    return value;
  }

  double chartValue(double imcValue) {
    double chartValue = 0;

    if (imcValue < 10) {
      chartStatus = 'Magreza';
      return 0.1;
    }

    if (imcValue > 50) {
      chartStatus = 'Obesidade Grave';
      return 7.0;
    }

    if (imcValue < 18.5) {
      chartStatus = 'Magreza';
      chartValue = (imcValue - 10) * 0.17 + 0.1;
    } else if (imcValue > 18.5 && imcValue < 24.9) {
      chartStatus = 'Normal';
      chartValue = (imcValue - 18.5) * 0.23 + 1.5;
    } else if (imcValue > 24.9 && imcValue < 29.9) {
      chartStatus = 'Sobrepeso';
      chartValue = (imcValue - 24.9) * 0.28 + 3.0;
    } else if (imcValue > 30.0 && imcValue > 39.9) {
      chartStatus = 'Obesidade';
      chartValue = (imcValue - 30) * 0.14 + 4.5;
    } else {
      chartStatus = 'Obesidade Grave';
      chartValue = (imcValue - 40) * 0.14 + 6;
    }

    return chartValue;
  }

  @override
  Widget build(BuildContext context) {
    final double screenAvaliableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    final double screenAvaliableWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(
          actionTextColor: Theme.of(context).backgroundColor,
          iconText: 'Voltar',
          backgroundColor: Colors.white,
          context: context,
          title: 'IMC & TMB',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0, 1]
                  .map(
                    (int index) => Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              sexList[index],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: Color.fromRGBO(189, 189, 189, 1),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Radio<int>(
                              groupValue: radioSex,
                              value: index,
                              activeColor: Theme.of(context).backgroundColor,
                              onChanged: (value) {
                                setState(() {
                                  radioSex = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromRGBO(232, 232, 232, 1),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Container(
              height: 50,
              width: screenAvaliableWidth * 0.952,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromRGBO(232, 232, 232, 1),
                  borderRadius: BorderRadius.circular(100)),
              padding: const EdgeInsets.only(left: 19),
              margin: const EdgeInsets.all(5),
              child: Form(
                key: _idadeFormKey,
                child: TextFormField(
                  controller: _idadeController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, insira sua idade.';
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
                    hintText: 'Idade',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize:
                          16 * (MediaQuery.of(context).textScaleFactor * 0 + 1),
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
              padding: const EdgeInsets.only(left: 19),
              margin: const EdgeInsets.all(5),
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
                      fontSize:
                          16 * (MediaQuery.of(context).textScaleFactor * 0 + 1),
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
              padding: const EdgeInsets.only(left: 19),
              margin: const EdgeInsets.all(5),
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
                      fontSize:
                          16 * (MediaQuery.of(context).textScaleFactor * 0 + 1),
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(189, 189, 189, 1),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
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
                  if (_idadeFormKey.currentState.validate() &&
                      _pesoFormKey.currentState.validate() &&
                      _alturaFormKey.currentState.validate()) {
                    setState(() {
                      _imcValue = imcCalculator();
                      _tmbValue = tmbCalculador();
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: BorderSide(color: Theme.of(context).backgroundColor)),
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
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Column(
                  children: [
                    Text(
                      'IMC:',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).backgroundColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ChartComponent(
                      imcValue: _imcValue,
                      chartValue: chartValue(_imcValue),
                      statusText: chartStatus,
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'TMB',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).backgroundColor),
                    ),
                    Container(
                      width: screenAvaliableWidth * 0.25,
                      height: screenAvaliableHeight * 0.058,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Text(
                              _tmbValue.toStringAsFixed(3),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Kcal por dia',
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
                    // SizedBox(
                    //   height: 155,
                    // ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
