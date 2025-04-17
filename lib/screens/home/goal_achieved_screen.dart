import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../app_color/color.dart';
import '../../ui_widgets/button_widget.dart';

class GoalAchievedScreen extends StatelessWidget {
  const GoalAchievedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Padding(
          padding: EdgeInsets.all(10),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/ui/success.png',width: double.infinity,height: MediaQuery.sizeOf(context).height*0.3,),
            TextWidget(text: "6000 Steps!",isBold: true,fontSize: 30,),
            TextWidget(text: "Congratulations",fontSize: 15,),
            TextWidget(text: "You've completed the step goal",fontSize: 15,),

            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
                height: MediaQuery.sizeOf(context).height * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.secondaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.timelapse),
                        TextWidget(text: "1h 14m", isBold: true, fontSize: 16),
                        TextWidget(text: "time", fontSize: 14),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: VerticalDivider(
                        thickness: 1,
                        width: 1,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.timelapse),
                        TextWidget(text: "1h 14m", isBold: true, fontSize: 16),
                        TextWidget(text: "time", fontSize: 14),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: VerticalDivider(
                        thickness: 1,
                        width: 1,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.timelapse),
                        TextWidget(text: "1h 14m", isBold: true, fontSize: 16),
                        TextWidget(text: "time", fontSize: 14),
                      ],
                    ),
                  ],
                )),
            DividerWidget(),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColor.secondaryColor,
        padding: EdgeInsets.all(20),
        child: Row(
          spacing: 20,
          children: [
            Expanded(child: ButtonWidget(onPress: (){},title: 'Stop Step',color: AppColor.optionalColor,titleColor: AppColor.primaryColor,)),
            Expanded(child: ButtonWidget(onPress: (){},title: 'Continue Steps',color: AppColor.primaryColor,)),

          ],
        ),
      ),
    );
  }
}
