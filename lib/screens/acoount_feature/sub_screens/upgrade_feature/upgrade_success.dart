import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class UpgradeSuccess extends StatelessWidget {
   UpgradeSuccess({super.key});

  final List<String>list=[
    "Detailed Reports",
    "Personalized Insights",
    "Exclusive Challenges",
    "Ad-Free Experience",
    "Priority Support"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        spacing: 20,
        children: [
          Image.asset("assets/images/ui/event.png",
          height: 100,
          ),
          Image.asset("assets/images/ui/event_success.png",
            height: 100,
          ),
          TextWidget(text: "Congratulations",isBold: true,fontSize: 30,),
          TextWidget(text: "You've Upgraded to TrackFit Yearly Premium",fontSize: 17),
          DividerWidget(),
          TextWidget(text: "Benefits Unlocked:",isBold: true,fontSize: 18,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  list.length,
                      (index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 90.0),
                      child: Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.check),
                          Flexible(child: TextWidget(text:list[index],fontSize:17,)),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          DividerWidget(),
          TextWidget(text: "Get ready to take your fitness journey to the next level with TrackFit Premium!",fontSize: 17,textAlign: TextAlign.center,),
          DividerWidget(),
          ButtonWidget(onPress: (){},

          title: "Start Exploring Premium Features",)



        ],
      ),
      ),
    );
  }
}
