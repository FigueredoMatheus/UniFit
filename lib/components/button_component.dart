import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final String snackbarText;
  final double width;
  final double height;
  final Function onPressed;
  final GlobalKey<FormState> keyForm;

  ButtonComponent({
    this.backgroundColor,
    this.textColor,
    this.text,
    this.height,
    this.width,
    this.onPressed,
    this.snackbarText = '',
    this.keyForm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: () {
          if (!onPressed()) {
            final snackBar = SnackBar(
              content: Text(snackbarText),
              duration: Duration(seconds: 3),
              backgroundColor: Theme.of(context).backgroundColor,
            );
            Scaffold.of(context).showSnackBar(snackBar);
          }
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(color: Theme.of(context).backgroundColor)),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16 * (MediaQuery.of(context).textScaleFactor * 0 + 1),
            fontWeight: FontWeight.w600,
            color:
                textColor != null ? textColor : Color.fromRGBO(93, 176, 117, 1),
          ),
        ),
        color: backgroundColor,
        elevation: 0,
      ),
    );
  }
}
