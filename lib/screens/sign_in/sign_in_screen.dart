import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/firebase/auth/firebase_auth_exceptions.dart';
import 'package:fitness_app/firebase/auth/state_checker.dart';
import 'package:fitness_app/firebase/firebase_riverpord/firebase_riverpord.dart';
import 'package:fitness_app/ui_widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../animations/transition.dart';
import '../../app_color/color.dart';
import '../../firebase/firebase_crud_operations/crud_operations.dart';
import '../../ui_models/welcome_screen_model.dart';
import '../../ui_widgets/basic_widgets.dart';
import '../../ui_widgets/button_widget.dart';
import '../../ui_widgets/text_widget.dart';
import '../../ui_widgets/textformfield_widget.dart';
import '../acoount_feature/sub_screens/linked_account_feature/model.dart';
import '../main_screen/main_screen.dart';
import '../sign_up/user_form_screen.dart';
import 'forgot_password/send_otp_screen.dart';

class SignInScreen extends ConsumerWidget {
   SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCon=TextEditingController();
   final TextEditingController _passwordCon=TextEditingController();
   final _checkBox=StateProvider.autoDispose<bool>((ref)=>false);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    StateChecker.checkFirebaseAuthState(context, ref);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.secondaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.secondaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(5.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: TextWidget(text: "Welcome Back! 👋",isBold: true,fontSize: 31,),
                ),
                TextWidget(text: "Sign in to continue your fitness journey.",fontSize: 18,),
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      TextWidget(text: "Email",fontSize: 18,),
                      TextFieldWidget(
                        controller: _emailCon,
                        leadingIcon: CustomIcons.message,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      TextWidget(text: "Password",fontSize: 18,),
                      TextFieldWidget(
                        leadingIcon: Icons.lock,
                        fillColor: Colors.grey.shade200,
                        controller: _passwordCon,
                        hintText: 'Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 5,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: ref.watch(_checkBox),
                      onChanged: (value) {
                        ref.read(_checkBox.notifier).state = value!;
                      },
                      activeColor: AppColor.primaryColor,
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      side: BorderSide(
                        color: AppColor.primaryColor,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    Text(
                       "Remember me",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>SendOtpScreen()));
                      },
                      child: Text(
                       "Forgot Password? ",
                        style: TextStyle(color: AppColor.primaryColor,fontSize: 17, fontWeight: FontWeight.w700 ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: DividerWidget()),
                    TextWidget(text: "   or   "),
                    Expanded(child: DividerWidget()),
                  ],
                ),
                ...List.generate(3, (index){
                  return ButtonWidget(
                    color: Colors.white,
                    isBorder: true,
                    onPress: ()async{
                      if(index==0){
                        bool val= await ref.read(loginControllerProvider.notifier).continueWithGoogle();
                        if(val){
                          bool temp=await ref.read(firebaseCRUDProvider).documentExists("users", ref.watch(currentUserProvider)!.uid);
                          print("Document exists: $temp");
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MainScreen()),
                                (route) => false,
                          );
                          return;
                        }
                        else{
                          TransitionAnimation.navigator(context, UserFormScreen());
                        }
                      }

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
                              image: NetworkImage(socialMediaNetworkImages[index]),
                            ),
                          ),
                        ),
                        TextWidget(text: WelcomeScreenModel.list[index].title,isBold: true,)
                      ],
                    ),

                  );
                }),

                ButtonWidget(onPress: ()async{
                  if(_formKey.currentState!.validate()){
                    AuthResultStatus status= await ref.read(loginControllerProvider.notifier).loginWithEmailAndPassword(_emailCon.text, _passwordCon.text);
                   print("Status is: $status");
                    UiEventHandler.snackBarWidget(context, AuthExceptionHandler.generateExceptionMessage(status),false);

                  }

                },title: "Sign in",
                  color: AppColor.primaryColor,
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
