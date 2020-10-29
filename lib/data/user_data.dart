import 'package:flutter/material.dart';

class UserData {
  String name;
  String email;
  String password;
  String water;
  String calories;

  UserData({
    @required this.name,
    @required this.email,
    this.calories = '0',
    @required this.password,
    this.water = '0',
  });
}
