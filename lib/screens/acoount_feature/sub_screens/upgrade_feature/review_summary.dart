import 'package:fitness_app/screens/acoount_feature/sub_screens/upgrade_feature/component_widget.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/upgrade_feature/upgrade_success.dart';
import 'package:fitness_app/ui_models/account_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_color/color.dart';
import '../../../../ui_widgets/button_widget.dart';
import '../../../../ui_widgets/text_widget.dart';
import '../../account_screen.dart';
class ReviewSummary extends ConsumerWidget {
  const ReviewSummary({super.key,
  required this.index
  });
  final int index;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,

      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,

        title: TextWidget(text: "Review Summary"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10,bottom: 150),
          child:Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrackFitPremium(index: ref.watch(accountScreenMonthlyOrYearlyProvider), list1:  ref.watch(accountScreenMonthlyOrYearlyProvider)==0?monthlyList:yearlyList),
              TextWidget(text: "Selected Payment Method",fontSize: 18,isBold: true,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.secondaryColor
                ),
                child: ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color:  AppColor.primaryColor,
                        image: DecorationImage(image: AssetImage(assetImages[index]),
                            fit: BoxFit.fill
                        )
                    ),

                  ),
                  title: TextWidget(text: "PayPal",isBold: true,),
                  subtitle: TextWidget(text: "saqlainalishah@gmail.com"),
                  trailing: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: TextWidget(text: "Change",color: AppColor.primaryColor,isBold: true,fontSize: 14,)),
                ),

              ),
            ],
          ),
        ),
      ),
      bottomSheet:Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        color: AppColor.secondaryColor,
        child:  ButtonWidget(onPress: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>UpgradeSuccess()));
        },
          title:  ref.watch(accountScreenMonthlyOrYearlyProvider)==0?"Confirm payment - \$4.99":"Confirm payment - \$49.99",
        ),
      ),
    );
  }
}
