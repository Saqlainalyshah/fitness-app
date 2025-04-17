import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class LinkedAccounts extends StatelessWidget {
   const LinkedAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,

        centerTitle: true,
        title: TextWidget(text: "Linked Accounts",isBold: true,),
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: socialMediaNetworkImages.length,
          itemBuilder: (context,index){
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.secondaryColor,
          ),
          child: Row(
            spacing: 10,
            
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(socialMediaNetworkImages[index]),
                  fit: BoxFit.cover
                  )
                ),
                
              ),
              TextWidget(text: "Google",isBold: true,fontSize: 20,),
              Spacer(),
              TextWidget(text: "Connected",isBold: true,fontSize: 18,color:index>1?AppColor.primaryColor: Colors.grey.shade500,)
            ],
          )
        );
      }, separatorBuilder: (BuildContext context, int index) {
            return Padding(padding: EdgeInsets.all(10));
      },),
      ),
    );
  }
}
