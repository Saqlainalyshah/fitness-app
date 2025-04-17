import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/upgrade_feature/review_summary.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../ui_models/account_screen_model.dart';
import '../../../../ui_widgets/button_widget.dart';

final selectedIndexProvider=StateProvider.autoDispose<int>((ref)=>0);
class ChoosePaymentMethods extends ConsumerWidget {
   ChoosePaymentMethods({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,

      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,

        title: TextWidget(text: "Choose Payment Methods"),
        actions: [
          IconButton(onPressed: () {  },
          icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10,bottom: 150),
          child: ListView.separated(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondaryColor,
                border: ref.watch(selectedIndexProvider)==index?Border.all(
                  width: 2.0,
                  color: AppColor.primaryColor
                ):null
              ),
              child: ListTile(
                onTap: (){
                  ref.read(selectedIndexProvider.notifier).state=index;
                },
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                   // color:  AppColor.primaryColor,
                    border: Border.all(
                      color: Colors.grey.shade400
                    ),
                      image: DecorationImage(image: AssetImage(assetImages[index]),
                          fit: BoxFit.fill
                      )
                  ),

                ),
                title: TextWidget(text: "PayPal",isBold: true,),
                subtitle: TextWidget(text: "saqlainalishah@gmail.com"),
                trailing: ref.watch(selectedIndexProvider)==index?Icon(Icons.check,color: AppColor.primaryColor,):null,
              ),

            );
          }, separatorBuilder: (BuildContext context, int index) {
              return Padding(padding: EdgeInsets.all(10));
          },),
        ),
      ),
      bottomSheet:Container(
        padding: EdgeInsets.all(10),
        color: AppColor.secondaryColor,
        child:  ButtonWidget(onPress: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>ReviewSummary(index: ref.watch(selectedIndexProvider),)));
        },
          title:  "Ok",
        ),
      ),
    );
  }
}
