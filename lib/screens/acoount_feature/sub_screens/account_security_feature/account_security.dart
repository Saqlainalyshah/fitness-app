import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../ui_widgets/switch.dart';

class AccountSecurity extends StatelessWidget {
  const AccountSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: "Account & Security",isBold:  true,),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context,index){
        List<String> titles=["Biometric ID",
          "Face ID","SMS Authenticator","Google Authenticator",
          "Change Password","Device Management","Deactivate Account","Delete Account"];
        List<String> subTitles=["","","","","","Manage your account on the various devices you own.",
          "Temporarily deactivate your account. Easily reactivate when you're ready.",
          "Permanently remove your account and data. Proceed with caution.",

        ];
        return ListTile(
         titleAlignment: ListTileTitleAlignment.top,
          title: TextWidget(text: titles[index],isBold: true,color: index==7?Colors.red:Colors.black),
          subtitle: index>3?Text(subTitles[index]):null,
          trailing: index>3?Icon(Icons.arrow_forward_ios):SwitchWidget(value: true, onChanged: (value){}),
        );
    }),),
    );
  }
}
