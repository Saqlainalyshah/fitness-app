import 'package:flutter/material.dart';

import '../../../../app_color/color.dart';
import '../../../../ui_widgets/basic_widgets.dart';
import '../../../../ui_widgets/text_widget.dart';
class TrackFitPremium extends StatelessWidget {
   const TrackFitPremium({super.key,
   required this.index,
     required this.list1
   });
  final int index;
  final List<String> list1;


  @override
  Widget build(BuildContext context) {
    return   Column(
      spacing: 10,
      children: [
         index==1?Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius:BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                  )
              ),
              child: TextWidget(text: "Save 17%",color: AppColor.secondaryColor),
            )
          ],

        ):   SizedBox(height: 10,),
        TextWidget(text: "TrackFit Premium",isBold: true,fontSize: 18,),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:  index==0?"\$4.99":"\$49.99",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35),
              ),
              TextSpan(
                text:index==0?"/month":"/year",
                style: TextStyle( fontWeight: FontWeight.bold,color: Colors.black),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DividerWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 20,
            children: List.generate(
                list1.length,
                    (index){
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Icon(Icons.check),
                      Expanded(child: TextWidget(text:list1[index],fontSize:18,)),
                    ],
                  );
                }),
          ),
        )
      ],
    );
  }
}
