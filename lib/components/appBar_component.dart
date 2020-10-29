import 'package:flutter/material.dart';

PreferredSizeWidget appBar({
  String title,
  String iconText,
  BuildContext context,
  Function onPressed,
  Color backgroundColor = Colors.white,
  Color titleTextColor = Colors.black,
  @required Color actionTextColor,
}) {
  double textScaleFactor = (MediaQuery.of(context).textScaleFactor * 0 + 1);
  return AppBar(
    leadingWidth: 79,
    titleSpacing: 1,
    leading: FlatButton(
      onPressed: onPressed,
      padding: const EdgeInsets.only(right: 5),
      child: Text(
        iconText,
        style: TextStyle(
          fontFamily: 'Inter',
          color: actionTextColor,
          fontSize: 16 * textScaleFactor,
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: titleTextColor,
        fontFamily: 'Inter',
        fontSize: 30 * textScaleFactor,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: backgroundColor,
    elevation: 0,
  );
}
