import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_color/color.dart';
import '../../../../ui_models/account_screen_model.dart';
import '../../account_screen.dart';
import '../upgrade_feature/component_widget.dart';
class BillingSubscription extends ConsumerWidget {
  const BillingSubscription({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: TextWidget(text: "Billing and Subscriptions",isBold: true,),
      ),
      body: Padding(padding: EdgeInsets.all(10),
/*Your subscription will expire on Dec 22, 2025.
Renew or cancel your subscription here.*/
    child: Column(
      spacing: 20,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.secondaryColor
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TrackFitPremium(index: ref.watch(accountScreenMonthlyOrYearlyProvider), list1:  ref.watch(accountScreenMonthlyOrYearlyProvider)==0?monthlyList:yearlyList),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DividerWidget(),
              ),
              TextWidget(text: "Your, current plan",isBold:  true,fontSize: 18,color: Colors.grey.shade500,)
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 18),  // ✅ Ensures text inherits proper styling
            children: [
              TextSpan(
                text: "Your subscription will expire on Dec 22, 2025 Renew or cancel your subscription",
                style: TextStyle(color: Colors.grey.shade500,),
              ),
              TextSpan(
                text: " here",
                style: TextStyle(color: AppColor.primaryColor, ),
              ),

            ],
          ),
        )
     ]
    ),
      ),
    );
  }
}
