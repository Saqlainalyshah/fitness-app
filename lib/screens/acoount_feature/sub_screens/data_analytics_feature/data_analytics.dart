import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DataAnalytics extends StatelessWidget {
  const DataAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar:AppBar(
        backgroundColor: Colors.grey.shade200,

        title: TextWidget(text: "Data & Analytics",isBold: true,),
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
          itemBuilder: (context,index){
          List<String> title=["Data Usage","Ad Preferences","Download My Data"];
          List<String> subTitle=["Control how your data is used for analytics. Customize your preferences.",
            "Manage ad personalization settings. Tailor your ad experience.",
            "Request a copy of your data. Your information, your control."
          ];
         return ListTile(
            titleAlignment: ListTileTitleAlignment.top,
            title: TextWidget(text: title[index],fontSize: 18,isBold: true,),
            subtitle: TextWidget(text: subTitle[index],color: Colors.grey.shade800,),
            trailing: Icon(Icons.arrow_forward_ios),
          );

    }),
      ),
    );
  }
}
