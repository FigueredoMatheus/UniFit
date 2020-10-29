import 'package:flutter/material.dart';

import 'mealsCard_component.dart';

class MealsComponent extends StatelessWidget {
  final String titleText;
  final String imageLeftAsset;
  final String imageRightAsset;
  final String mealLeftName;
  final String mealRightName;

  MealsComponent({
    @required this.titleText,
    @required this.imageLeftAsset,
    @required this.imageRightAsset,
    @required this.mealLeftName,
    @required this.mealRightName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            titleText,
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20 * (MediaQuery.of(context).textScaleFactor * 0 + 1),
                fontWeight: FontWeight.w500,
                color: Theme.of(context).backgroundColor),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MealsCardComponent(
              imagePath: imageLeftAsset,
              mealName: mealLeftName,
            ),
            MealsCardComponent(
              imagePath: imageRightAsset,
              mealName: mealRightName,
            ),
          ],
        ),
      ],
    );
  }
}
