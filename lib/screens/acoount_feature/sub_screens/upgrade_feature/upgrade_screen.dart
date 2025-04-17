import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/upgrade_feature/component_widget.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../ui_models/account_screen_model.dart';
import '../../account_screen.dart';
import 'choose_payment_methods.dart';
class UpgradeScreen extends ConsumerWidget {
  UpgradeScreen({super.key});


  final List<String> appBarTitle=[
    "Upgrade Plan","Choose Payment Methods","Review Summary"
  ];
  final List<String> buttonLists=[
    "Continue - \$49.99","OK","Confirm Payment - \$49.99"
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: TextWidget(text: "Upgrade Plan",isBold: true,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              //spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(2, (index){
                List<String> list=["Monthly","Yearly"];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonWidget(onPress: (){
                      ref.read(accountScreenMonthlyOrYearlyProvider.notifier).state=index;
                    },
                      radius: 10,
                      color:  ref.watch(accountScreenMonthlyOrYearlyProvider)!=index?AppColor.secondaryColor:AppColor.primaryColor,
                      height: MediaQuery.sizeOf(context).height*50/1000,
                    title: list[index],
                      titleColor: ref.watch(accountScreenMonthlyOrYearlyProvider)!=index?Colors.black:AppColor.secondaryColor,

                    ),
                  ),
                );
              }),
            ),
            TrackFitPremium(index: ref.watch(accountScreenMonthlyOrYearlyProvider),
                list1:ref.watch(accountScreenMonthlyOrYearlyProvider)==0?monthlyList:yearlyList )
          ],
        ),
      ),
      bottomSheet:Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        color: AppColor.secondaryColor,
        child:  ButtonWidget(onPress: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>ChoosePaymentMethods()));
        },
          title:  ref.watch(accountScreenMonthlyOrYearlyProvider)==0?"Continue - \$4.99":"Continue - \$49.99",
        ),
      ),
    );
  }
}
