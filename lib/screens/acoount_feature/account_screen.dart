import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/account_security_feature/account_security.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/billing_subscription_feature/billing_subscription.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/data_analytics_feature/data_analytics.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/help_support_feature/help_support.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/level_feature/level_screen.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/linked_account_feature/linked_accounts.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/logout_feature/logout_screen.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/personal_info_feature/personal_info.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/preferances_feature/preferences.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/upgrade_feature/upgrade_screen.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountScreenMonthlyOrYearlyProvider=StateProvider<int>((ref)=>0);


class AccountScreen extends ConsumerWidget {
   AccountScreen({super.key});
final List<Icon> iconsList=[
  Icon(CustomIcons.water,color: Colors.blue,),
  Icon(CustomIcons.weight_tracker,color: Colors.orangeAccent,),
  Icon(CustomIcons.setting,),
  Icon(CustomIcons.profile,),
  Icon(Icons.payment,),
  Icon(CustomIcons.star,),
  Icon(CustomIcons.shield_done,),
  Icon(CustomIcons.swap,),
  Icon(CustomIcons.show,),
  Icon(CustomIcons.activity,),
  Icon(CustomIcons.paper),
  Icon(CustomIcons.logout,color: Colors.red,),

];
final List<String> titles=[
  'Water Tracker','Weight Tracker','Preferences','Personal Info'
  ,'Payment Methods','Billing and Subscriptions'
  ,'Account and Security','Linked Accounts','App Appearance',
  'Data and Analytics','Help and Support','Logout'
];
final List<int> list=[2,10];



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
        spacing: 20,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primaryColor
              ),
              child: Stack(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>UpgradeScreen()));
                    },
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: Icon(Icons.workspace_premium,color:Colors.orangeAccent),
                    ),
                    title: TextWidget( text: "Upgrade Plan Now!",isBold: true,color: AppColor.secondaryColor,),
                    subtitle: TextWidget(text: "Enjoy all the benefits and explore more possibilities",color: AppColor.secondaryColor,fontSize: 10,),
                  ),
                  Positioned(
                    left: 10,
                    top: 5,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.secondaryColor
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 5,
                    child: Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.secondaryColor
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 15,
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.secondaryColor
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 40,
                    child: Container(
                      width: 2,
                      height: 2,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.secondaryColor
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 55,
                    child: Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.secondaryColor
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 60,
                    child: Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.secondaryColor
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    top: 45,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.secondaryColor
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondaryColor
              ),
              child:   ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>LevelScreen()));
                },
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: Icon(Icons.workspace_premium,color:Colors.orangeAccent),
                ),
                title: TextWidget( text: "Level 9",isBold: true),
                subtitle: TextWidget(text: "You are a rising star! Keep going!",fontSize: 12,),
                trailing: Icon(Icons.navigate_next,size: 30,color: Colors.grey.shade700,),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context,index){
                  return   Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.secondaryColor
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: list[index],
                        itemBuilder: (context,subIndex){
                          return ListTile(
                            onTap: (){
                              if(subIndex==0){
                               Navigator.push(context, MaterialPageRoute(builder: (builder)=>PreferencesWidget()));
                              }
                              else if(subIndex==1){
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>PersonalInfo()));
                              }
                              else if(subIndex==2){
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>PersonalInfo()));
                              }
                              else if(subIndex==3){
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>BillingSubscription()));
                              }
                              else if(subIndex==4){
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>AccountSecurity()));
                              }
                              else if(subIndex==5){
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>LinkedAccounts()));
                              }
                              else if(subIndex==7){
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>DataAnalytics()));
                              }
                              else if(subIndex==8){
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>HelpAndSupport()));
                              }
                              else if(subIndex==9){

                                logoutPopUp(context,ref);

                              }
                            },
                            leading:index==1? iconsList[subIndex+2]:iconsList[subIndex],
                            title: TextWidget( text: index==1? titles[subIndex+2]:titles[subIndex],isBold: true,color: subIndex==9?Colors.red:Colors.black,),
                            trailing: Icon(Icons.navigate_next,size: 30,color: Colors.grey.shade700,),
                          );
                        }),
                  );

            }, separatorBuilder: (BuildContext context, int index) {
                return Padding(padding: EdgeInsets.all(10));
            },)

          ],
        ),
      ),
    );
  }
}
