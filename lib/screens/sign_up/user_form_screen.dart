import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/firebase/firebase_crud_operations/crud_operations.dart';
import 'package:fitness_app/firebase/firebase_riverpord/firebase_riverpord.dart';
import 'package:fitness_app/model_classes/user.dart';
import 'package:fitness_app/screens/main_screen/main_screen.dart';
import 'package:fitness_app/screens/sign_up/user_form_Screens/gender_widget.dart';
import 'package:fitness_app/screens/sign_up/user_form_Screens/height_widget.dart';
import 'package:fitness_app/screens/sign_up/user_form_Screens/lifestyle_widget.dart';
import 'package:fitness_app/screens/sign_up/user_form_Screens/old_widget.dart';
import 'package:fitness_app/screens/sign_up/user_form_Screens/step_goals_widget.dart';
import 'package:fitness_app/screens/sign_up/user_form_Screens/weight_widget.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ui_widgets/basic_widgets.dart';


class UserFormScreen extends StatelessWidget {
   UserFormScreen({super.key});
final PageController pageController =PageController();
   final _index=StateProvider<int>((ref)=>0);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.secondaryColor,
          leading: Consumer(
            builder:(context,ref,child)=> IconButton(onPressed: (){
              if(ref.watch(_index)==0){
                Navigator.pop(context);
      
              }else{
                ref.read(_index.notifier).state=ref.watch(_index)-1;
      
              }
            },icon: Icon(ref.watch(_index)==0?Icons.close:Icons.arrow_back)),
          ),
          title: Consumer(
            builder: (context, ref, child) => LinearProgressIndicator(
              value: (ref.watch(_index) / 5).clamp(0.0, 1.0),
              color: AppColor.primaryColor,
              backgroundColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
              minHeight: 15,
            ),
          ),
          actions: [
            Consumer(builder:(context,ref,child) =>TextWidget(text: "${ref.watch(_index)}/5",isBold: true,fontSize: 18,)),
            SizedBox(width: 20,)
          ],
        ),
        body:PageView.builder(
          itemCount: 6,
            controller: pageController,
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index){
            },
            itemBuilder: (context,index){
          List<Widget> userFormScreen=[
            GenderWidget(),
            LifeStyleWidget(),
            OldWidget(),
            HeightWidget(),
            WeightWidget(),
            StepGoalsWidget(),
          ];
          return Consumer(builder: (context,ref,child)=>userFormScreen[ref.watch(_index)]);
        }),
        bottomSheet: Consumer(
          builder:(context,ref,child)=> Container(
            color: AppColor.secondaryColor,
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 60,
              mainAxisSize: MainAxisSize.min,
              children: [
                DividerWidget(),
                Row(
                   spacing: 20,
                  children: [
                    Expanded(child: ButtonWidget(onPress: ()async{
                      
                      Preferences pref=Preferences(
                        age: ref.watch(age),
                        height: ref.watch(height),
                        weight: ref.watch(weight),
                        stepGoals: ref.watch(stepGoals),
                        sedentaryLife: ref.watch(lifeStyle)
                      );
                      
                      PersonalInfo person=PersonalInfo(
                        uid: ref.watch(currentUserProvider)?.uid,
                        name: ref.watch(currentUserProvider)?.displayName,
                        email: ref.watch(currentUserProvider)?.email,
                        photoUrl: ref.watch(currentUserProvider)?.photoURL,
                        phoneNumber: ref.watch(currentUserProvider)?.phoneNumber,
                        gender: ref.watch(gender),
                        birthDate: Timestamp.now(),
                        emailVerified: ref.watch(currentUserProvider)?.emailVerified,
                        preferences: pref,
                      );

                     bool result=await ref.watch(firebaseCRUDProvider).createDocumentWithId("users", ref.watch(currentUserProvider)!.uid, person.toJSON());
                     if(result){
                       Navigator.pushAndRemoveUntil(
                         context,
                         MaterialPageRoute(builder: (context) => MainScreen()),
                             (route) => false,
                       );
                     }

                    },title: 'Skip',color: AppColor.optionalColor,titleColor: AppColor.primaryColor,)),
                    Expanded(child: ButtonWidget(onPress: ()async{
                      if(ref.watch(_index)<5){
                        ref.read(_index.notifier).state=ref.watch(_index)+ 1;
                      }else{
                        Preferences pref=Preferences(
                            age: ref.watch(age),
                            height: ref.watch(height),
                            weight: ref.watch(weight),
                            stepGoals: ref.watch(stepGoals),
                            sedentaryLife: ref.watch(lifeStyle)
                        );
                        PersonalInfo person=PersonalInfo(
                          uid: ref.watch(currentUserProvider)?.uid,
                          name: ref.watch(currentUserProvider)?.displayName,
                          email: ref.watch(currentUserProvider)?.email,
                          photoUrl: ref.watch(currentUserProvider)?.photoURL,
                          phoneNumber: ref.watch(currentUserProvider)?.phoneNumber,
                          gender: ref.watch(gender),
                          birthDate: Timestamp.now(),
                          emailVerified: ref.watch(currentUserProvider)?.emailVerified,
                          preferences: pref,
                        );
                        bool result=await ref.watch(firebaseCRUDProvider).createDocumentWithId("users", ref.watch(currentUserProvider)!.uid, person.toJSON());
                        if(result){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MainScreen()),
                                (route) => false,
                          );
                        }
                      }

                    },title: 'Continue',color: AppColor.primaryColor,)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

