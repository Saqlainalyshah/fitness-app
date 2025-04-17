import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list=[
      "Customer Support",
    "Website","WhatsApp","Facebook","X Formerly Twitter","Instagram"
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: TextWidget(text: "Contact Support",isBold: true,),
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: ListView.separated(
          itemCount: 6,
          itemBuilder: (context,index){
        return Container(
          decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(
              Icons.language,color: AppColor.primaryColor,
            ),
            title: TextWidget(text: list[index],isBold: true,),
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey.shade700,size: 18,),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
            return Padding(padding: EdgeInsets.all(10));
      },),
      ),
    );
  }
}
