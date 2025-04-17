import 'package:flutter/material.dart';

class WelcomeScreenModel{
  String title;
  IconData icon;
  WelcomeScreenModel({
    required this.title,
    required this.icon,
});
  static List<WelcomeScreenModel> list =[
    WelcomeScreenModel(title: "Continue with Google", icon: Icons.check),
    WelcomeScreenModel(title: "Continue with Apple", icon: Icons.check),
    WelcomeScreenModel(title: "Continue with Facebook", icon:Icons.check),
    WelcomeScreenModel(title: "Continue with Twitter", icon: Icons.check),

  ];
}
