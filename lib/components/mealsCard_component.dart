import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MealsCardComponent extends StatelessWidget {
  final String imagePath;
  final String mealName;

  MealsCardComponent({
    @required this.imagePath,
    @required this.mealName,
  });

  @override
  Widget build(BuildContext context) {
    final double screenAvaliableWidth = MediaQuery.of(context).size.width;

    final double screenAvaliableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Container(
      width: screenAvaliableWidth * 0.45,
      height: screenAvaliableHeight * 0.30,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.51,
              width: constraints.maxWidth,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.asset(
                      imagePath,
                      width: constraints.maxWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: screenAvaliableWidth * 0.02,
                    bottom: constraints.maxHeight * 0.11,
                    child: Container(
                      width: constraints.maxWidth * 0.9,
                      height: constraints.maxHeight * 0.30,
                      child: Center(
                        child: Text(
                          mealName,
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.49,
              width: constraints.maxWidth,
              padding: EdgeInsets.only(top: 10),
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calorias: 1.000 kCal',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Theme.of(context).backgroundColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Proteínas: 1.000 mg',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Theme.of(context).backgroundColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Fibras: 1.000 mg',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Theme.of(context).backgroundColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Gorduras:  1.000 mg',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Theme.of(context).backgroundColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

/*
Card(
                margin: EdgeInsets.zero,
                child: Stack(
                  children: [
                    Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: screenAvaliableWidth * 0.45 / 13,
                      bottom: constraints.maxHeight * 0.3,
                      child: Container(
                        width: constraints.maxWidth * 0.8,
                        height: constraints.maxHeight * 0.35,
                        child: Center(
                          child: Text(
                            mealName,
                            textScaleFactor: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
*/

/*
 child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calorias: 1.000 kCal',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Theme.of(context).backgroundColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Proteínas: 1.000 mg',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Theme.of(context).backgroundColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Fibras: 1.000 mg',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Theme.of(context).backgroundColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Gorduras:  1.000 mg',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Theme.of(context).backgroundColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
*/
