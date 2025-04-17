import 'package:fitness_app/app_color/color.dart';
import 'package:flutter/material.dart';

class UiEventHandler{
  static snackBarWidget(BuildContext context,String message, bool isSuccess){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message,style: TextStyle(color: Colors.white),), backgroundColor: isSuccess?Colors.green:AppColor.primaryColor),
    );
  }

}