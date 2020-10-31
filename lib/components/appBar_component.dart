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
          fontSize: 16,
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textScaleFactor: 1,
      style: TextStyle(
        color: titleTextColor,
        fontFamily: 'Inter',
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: backgroundColor,
    elevation: 0,
  );
}

double appBarSize(PreferredSizeWidget appBar) {
  return appBar.preferredSize.height;
}
