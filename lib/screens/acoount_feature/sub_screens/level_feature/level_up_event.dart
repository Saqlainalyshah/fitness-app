import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:flutter/material.dart';

void showAchievementDialog(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: AppColor.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              // Achievement Badge Image
              Image.asset(index<9?"assets/images/level/level${index+1}.png":"assets/images/ui/lock-level.png", height: 200),
               Text(
                 index<9? "You've Reached Level ${index+1}!":"Locked Level ${index+1}!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
               Text(
                index<9?"Congratulations! You've taken a whopping 250,000 steps. Keep up the incredible effort!":"Try to unlock this level",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),

              ButtonWidget(onPress: (){
                Navigator.pop(context);
              },
              title: "Ok, Sure!",
              )
            ],
          ),
        ),
      );
    },
  );
}

