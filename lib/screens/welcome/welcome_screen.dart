import 'package:fitness_app/animations/transition.dart';
import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/firebase/firebase_riverpord/firebase_riverpord.dart';
import 'package:fitness_app/riverpord/global_providers.dart';
import 'package:fitness_app/screens/acoount_feature/sub_screens/linked_account_feature/model.dart';
import 'package:fitness_app/screens/sign_in/sign_in_screen.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../firebase/auth/state_checker.dart';
import '../../local_auth/local_auth.dart';
import '../../ui_models/welcome_screen_model.dart';
import '../sign_up/sign_up_screen.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key,
   this.value
  });
  final bool? value;
/*  Future<void>_getData(WidgetRef ref)async{
    bool result= await ref.read(localDatabaseProvider).getData("isLanded");
    print("SharedPref Welcome:$result");
    ref.read(tempProvider.notifier).state=result;
  }*/
  @override
  Widget build(BuildContext context,WidgetRef ref) {
   /* _getData(ref);*/
   /* StateChecker.checkFirebaseAuthState(context, ref);*/
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(spacing: 10,
              children: [
                SizedBox(height: 20,),
                Icon(CustomIcons.app,size: 50,color: AppColor.primaryColor,),
                SizedBox(height: 20,),
                TextWidget(text: "Let's Get Started!",isBold: true,fontSize: 30,),
                //Let's dive in into your account
                TextWidget(text: "Let's dive in into your account",fontSize: 18,),
                SizedBox(height: 20,),
                ListView.separated(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: WelcomeScreenModel.list.length,
                    itemBuilder: (context,index){
                      return ButtonWidget(
                        color: Colors.white,
                        isBorder: true,
                        onPress: (){
                        },
                        widget: Row(
                          spacing: 60,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(socialMediaNetworkImages[index],),)
                              ),
                            ),
                            TextWidget(text: WelcomeScreenModel.list[index].title,isBold: true,)
                          ],
                        ),

                      );



                }, separatorBuilder: (BuildContext context, int index) {
                    return Padding(padding: EdgeInsets.all(10));
                },),
                SizedBox(height: 20,),
                ButtonWidget(onPress: (){
                  ref.watch(isBiometricProvider)==true?
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>SignUpScreen())):
                  ref.read(localAuthControllerProvider).authenticateWithBiometrics(context)
                  ;

                },
                  title: "Sign up",
                ),
                ButtonWidget(onPress: (){
                 /* Navigator.push(context, MaterialPageRoute(builder: (builder)=>SignInScreen()));*/
                TransitionAnimation.navigator(context, SignInScreen());

                },
                  title: "Sign in",
                  titleColor: AppColor.primaryColor,
                  color: AppColor.optionalColor,

                ),
                Container(
                  padding: EdgeInsets.all(20),
                  color: AppColor.secondaryColor,
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(text: "Privacy Policy"),
                      TextWidget(text: "."),
                      TextWidget(text: "Terms of Service")
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
