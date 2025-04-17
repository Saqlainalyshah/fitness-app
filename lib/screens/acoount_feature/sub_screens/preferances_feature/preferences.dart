import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/preferances_feature/models.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/dropdown_widget.dart';
import 'package:fitness_app/ui_widgets/switch.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PreferencesWidget extends StatelessWidget {
   PreferencesWidget({super.key});
final List<int> l=[4,5,2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,

      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,

        title: Text("Preferences"),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        spacing: 20,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.secondaryColor
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context,subIndex){
                    List<String> list=[];
                      switch(subIndex){
                        case 0:list=PreferencesDataClass.genderList;
                        case 1:list=PreferencesDataClass.ageList;
                        case 2:list=PreferencesDataClass.heightList;
                        case 3:list=PreferencesDataClass.weightList;
                      }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(text: PreferencesDataClass.titlesList[subIndex],isBold: true,fontSize: 18,),
                       DropdownWidget(
                            isBorder: false,
                            value: list[0], list: list, onChanged: (value){

                        })
                      ],
                    );

                  }),
            ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.secondaryColor
            ),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context,subIndex){
                  List<String> list=[];

                    switch(subIndex){
                      case 0:list=PreferencesDataClass.unitList;
                      case 1:list=PreferencesDataClass.stepLength;
                      case 2:list=PreferencesDataClass.sensitivityList;
                      case 3:list=PreferencesDataClass.stepLength;
                      case 4:list=PreferencesDataClass.weekList;
                    }


                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: PreferencesDataClass.titlesList[subIndex+4],isBold: true,fontSize: 18,),
                       DropdownWidget(
                          isBorder: false,
                          value: list[0], list: list, onChanged: (value){

                      })
                    ],
                  );

                }),
          ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.secondaryColor
          ),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context,subIndex){
                List<String> list=PreferencesDataClass.remainderTimeList;

                 if(subIndex==1){
                   return DividerWidget();
                 }
               else{
                   return Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       TextWidget(text: PreferencesDataClass.titlesList[subIndex+8],isBold: true,fontSize: 18,),
                       subIndex==0?SwitchWidget(value: true, onChanged: (value){}) :DropdownWidget(
                           isBorder: false,
                           value: list[0], list: list, onChanged: (value){

                       })
                     ],
                   );
                 }

              }),
        ),

          ],
      ),
      ),
    );
  }
}
