import 'package:UniFit/data/user_data.dart';
import 'package:flutter/material.dart';

class LoggedUser {
  static final LoggedUser _instance = LoggedUser.internal();

  factory LoggedUser() => _instance;

  LoggedUser.internal();

  UserData loggedUserData;

  login({@required UserData userData}) {
    this.loggedUserData = userData;
  }
}
