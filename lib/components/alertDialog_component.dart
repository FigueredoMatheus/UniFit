import 'package:UniFit/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AlertDialogComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Deseja realmente sair?',
        textScaleFactor: 1,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: Text('Sim')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar'))
      ],
    );
  }
}
