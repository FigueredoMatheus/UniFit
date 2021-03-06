import 'package:UniFit/components/appBar_component.dart';
import 'package:UniFit/models/user_model.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  final LoggedUser user = LoggedUser();
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget scaffoldAppBar = appBar(
      backgroundColor: Color.fromRGBO(93, 176, 117, 1),
      context: context,
      iconText: 'Voltar',
      title: 'Perfil',
      actionTextColor: Colors.white,
      titleTextColor: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
    );

    final double screenAvaliableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBarSize(scaffoldAppBar);

    final double screenAvaliableWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: scaffoldAppBar,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: (screenAvaliableHeight) * 0.25,
              color: Theme.of(context).backgroundColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: (screenAvaliableHeight) * 0.05,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(232, 232, 232, 1),
                  radius: screenAvaliableHeight * 0.145,
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).backgroundColor,
                    size: screenAvaliableHeight * 0.26,
                  ),
                ),
                SizedBox(height: 35),
                Center(
                  child: Text(
                    user.loggedUserData.name,
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
                SizedBox(height: screenAvaliableHeight * 0.04),
                Center(
                  child: Text(
                    user.loggedUserData.email,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenAvaliableHeight * 0.11,
                ),
                Center(
                  child: Container(
                    width: screenAvaliableWidth * 0.89,
                    height: screenAvaliableHeight * 0.1,
                    child: Card(
                      child: Center(
                        child: Text(
                          'Já bebeu ${user.loggedUserData.water} litros de água hoje',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: screenAvaliableWidth * 0.89,
                    height: screenAvaliableHeight * 0.1,
                    child: Card(
                      child: Center(
                        child: Text(
                          'Já ingeriu ${user.loggedUserData.calories} calorias hoje',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
