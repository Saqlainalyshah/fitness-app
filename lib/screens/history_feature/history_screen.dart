import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
class HistoryScreen extends StatelessWidget {
   HistoryScreen({super.key});
final List<int>listData=[3,7,1,3,1];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: listData.length,
            itemBuilder: (context,index){
            int innerIndex=listData[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(text: "Today",fontSize: 18,color: Colors.grey,isBold: true,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(6)

                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:innerIndex,
                  itemBuilder: (context,subIndex){
                    List<Icon>icons=[
                      Icon(CustomIcons.app,color: AppColor.primaryColor,size: 20,),
                      Icon(CustomIcons.time_circle,color: Colors.orange,),
                      Icon(CustomIcons.kcl,color: Colors.red,),
                      Icon(CustomIcons.location,color: Colors.green,),
                    ];
                    List<String> data=[
                      '6,496','1h 34m','525','7.23'
                    ];
                    return Dismissible(
                      background: Container(
                        color: Colors.red.shade200.withOpacity(0.3),
                        child: Icon(Icons.delete_outline_outlined,color: Colors.red,),
                      ),
                      key: ValueKey<int>(0),
                      child: Column(
                        spacing: 10,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:   List.generate(4, (nestedIndex){
                              return Row(
                                spacing: 3,
                                children: [
                                  icons[nestedIndex],
                                  TextWidget(text: data[nestedIndex],isBold: true,)
                                ],
                              );

                            }),
                          ),
                          DividerWidget(),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                    );
                  },

                ),
              )
            ],
          );
        }, separatorBuilder: (BuildContext context, int index) {
            return Padding(padding: EdgeInsets.all(10));
        },),
      ),
    );
  }
}
