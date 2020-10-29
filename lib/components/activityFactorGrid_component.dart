import 'package:flutter/material.dart';

class ActivityFactorGrid extends StatefulWidget {
  final Function(int radioValue) callBack;
  final Function() setState;
  ActivityFactorGrid({this.callBack, this.setState});

  @override
  _ActivityFactorGridState createState() => _ActivityFactorGridState();
}

class _ActivityFactorGridState extends State<ActivityFactorGrid> {
  int radioValue = 0;

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = (MediaQuery.of(context).textScaleFactor * 0 + 1);
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 155,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sedentário',
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16 * textScaleFactor,
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Radio(
                          activeColor: Theme.of(context).backgroundColor,
                          groupValue: 0,
                          value: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = 0;
                              widget.callBack(radioValue);
                              widget.setState();
                            });
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(232, 232, 232, 1),
                    )
                  ],
                ),
              ),
              Container(
                width: 180,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Levemente Ativo',
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16 * textScaleFactor,
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Radio(
                          activeColor: Theme.of(context).backgroundColor,
                          groupValue: 1,
                          value: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = 1;
                              widget.callBack(radioValue);
                              widget.setState();
                            });
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(232, 232, 232, 1),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 155,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Moderado',
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16 * textScaleFactor,
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Radio(
                          activeColor: Theme.of(context).backgroundColor,
                          groupValue: 2,
                          value: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = 2;
                              widget.callBack(radioValue);
                              widget.setState();
                            });
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(232, 232, 232, 1),
                    )
                  ],
                ),
              ),
              Container(
                width: 180,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Muito Ativo',
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16 * textScaleFactor,
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Radio(
                          activeColor: Theme.of(context).backgroundColor,
                          groupValue: 3,
                          value: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = 3;
                              widget.callBack(radioValue);
                              widget.setState();
                            });
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(232, 232, 232, 1),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            width: 155,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Extremo Ativo',
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16 * textScaleFactor,
                        color: Color.fromRGBO(189, 189, 189, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Radio(
                      activeColor: Theme.of(context).backgroundColor,
                      groupValue: 4,
                      value: radioValue,
                      onChanged: (value) {
                        setState(() {
                          radioValue = 4;
                          widget.callBack(radioValue);
                          widget.setState();
                        });
                      },
                    ),
                  ],
                ),
                Divider(
                  color: Color.fromRGBO(232, 232, 232, 1),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
