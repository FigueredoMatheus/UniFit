import 'dart:math';

import 'package:flutter/material.dart';

class ChartComponent extends StatelessWidget {
  final String statusText;
  final double imcValue;
  final double chartValue;

  ChartComponent(
      {@required this.statusText,
      @required this.imcValue,
      @required this.chartValue});

  @override
  Widget build(BuildContext context) {
    final double screenAvaliableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    final double screenAvaliableWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Stack(
        children: [
          Container(
            width: screenAvaliableWidth * 0.375,
            height: screenAvaliableWidth * 0.375,
            child: CustomPaint(
              painter: ChartPainter(
                context: context,
                chartValue: chartValue,
              ),
            ),
          ),
          Positioned(
            top: screenAvaliableHeight * 0.07,
            right: screenAvaliableWidth * 0.056,
            child: Container(
              width: screenAvaliableWidth * 0.265,
              height: screenAvaliableHeight * 0.052,
              child: FittedBox(
                child: Column(
                  children: [
                    Text(
                      double.parse(imcValue.toString()).toStringAsFixed(1),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      statusText,
                      style: TextStyle(
                        color: Color.fromARGB(153, 153, 153, 1),
                        fontFamily: 'Inter',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  final BuildContext context;
  final double chartValue;

  ChartPainter({
    this.context,
    this.chartValue = 0.1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var outlineBackground = Paint()
      ..color = Color.fromRGBO(232, 232, 232, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    var outlineForeground = Paint()
      ..color = Theme.of(context).backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawCircle(center, radius, outlineBackground);

    var foregroundOffset = Offset(0, 0);

    canvas.drawArc(foregroundOffset & Size(size.width, size.height), -1.5,
        -chartValue, false, outlineForeground);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
