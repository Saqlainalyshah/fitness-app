import 'package:fitness_app/screens/acoount_feature/sub_screens/help_support_feature/sub_screens/contact_support.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/help_support_feature/sub_screens/faq_screen.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/help_support_feature/sub_screens/privacy_policy.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/help_support_feature/sub_screens/terms_services.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list=[
      "FAQ","Contact Support","Privacy Policy","Terms of Service","Partner","Job Vacancy",
      "Accessibility","Feedback","About us","Visit our Website","Follow us on Social Media"
    ];
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: "Help and Support",isBold: true,),

      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
        return ListTile(
          splashColor: Colors.transparent,
          onTap: (){
            if(index==0){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>FAQScreen()));
            }
            else if(index==1){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>ContactSupport()));
            }
            else if(index==2){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>PrivacyPolicy()));
            }
            else if(index==3){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>TermsServices()));
            }
          },
          title: TextWidget(text: list[index],isBold: true,),
          trailing: Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey.shade800,),
        );
      }),
      ),
    );
  }
}
