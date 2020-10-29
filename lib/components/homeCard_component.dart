import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final Function onTap;

  CardComponent({this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    bool containerTextSize() {
      if (MediaQuery.of(context).textScaleFactor > 1 && title != 'Meu Perfil' ||
          title != 'Refeições')
        return true;
      else
        return false;
    }

    final double screenAvaliableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    final double screenAvaliableWidth = MediaQuery.of(context).size.width;
//MediaQuery.of(context).textScaleFactor
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
        width: screenAvaliableWidth * 0.84,
        height: screenAvaliableHeight * 0.17,
        child: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              width: MediaQuery.of(context).textScaleFactor > 1 &&
                          title == 'Calculadora de IMC & TMB' ||
                      title == 'Calculadora de Gordura e Calorias'
                  ? constraints.maxWidth * 0.95
                  : constraints.maxWidth * 0.69,
              height: MediaQuery.of(context).textScaleFactor > 1 &&
                          title == 'Calculadora de IMC & TMB' ||
                      title == 'Calculadora de Gordura e Calorias'
                  ? constraints.maxHeight * 0.90
                  : constraints.maxHeight * 0.74,
              color: Colors.red,
              child: MediaQuery.of(context).textScaleFactor > 1
                  ? FittedBox(
                      child: Center(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 24 *
                                  (MediaQuery.of(context).textScaleFactor * 0 +
                                      1),
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 24 *
                                (MediaQuery.of(context).textScaleFactor * 0 +
                                    1),
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
            );
          }),
        ),
      ),
    );
  }
}
