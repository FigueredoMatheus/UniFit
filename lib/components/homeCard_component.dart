import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final Function onTap;
  final double height;
  final double width;

  CardComponent({
    this.onTap,
    this.title,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Container(
          width: MediaQuery.of(context).textScaleFactor > 1 &&
                  (title == 'Calculadora de IMC & TMB' ||
                      title == 'Calculadora de Gordura e Calorias')
              ? width * 0.95
              : width * 0.69,
          height: MediaQuery.of(context).textScaleFactor > 1 &&
                      title == 'Calculadora de IMC & TMB' ||
                  title == 'Calculadora de Gordura e Calorias'
              ? height * 0.90
              : height * 0.74,
          child: MediaQuery.of(context).textScaleFactor > 1
              ? FittedBox(
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24,
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
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
        )),
      ),
    );
  }
}
