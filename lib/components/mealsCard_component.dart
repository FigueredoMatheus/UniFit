import 'package:flutter/material.dart';

class MealsCardComponent extends StatelessWidget {
  final String imagePath;
  final String mealName;

  MealsCardComponent({
    @required this.imagePath,
    @required this.mealName,
  });

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = (MediaQuery.of(context).textScaleFactor * 0 + 1);

    final double screenAvaliableWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenAvaliableWidth / 2,
      child: Column(
        children: [
          Card(
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    right: 8,
                    bottom: 30,
                    child: Container(
                        width: 120,
                        height: 50,
                        child: Center(
                          child: Text(
                            mealName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontSize: 16 * textScaleFactor,
                                fontWeight: FontWeight.w500),
                          ),
                        ))),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Calorias: 1.000 kCal',
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Theme.of(context).backgroundColor,
                  fontSize: 14 * textScaleFactor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Proteínas: 1.000 mg',
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Theme.of(context).backgroundColor,
                  fontSize: 14 * textScaleFactor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Fibras: 1.000 mg',
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Theme.of(context).backgroundColor,
                  fontSize: 14 * textScaleFactor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Gorduras:  1.000 mg',
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Theme.of(context).backgroundColor,
                  fontSize: 14 * textScaleFactor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
