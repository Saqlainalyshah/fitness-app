import 'package:fitness_app/animations/transition.dart';
import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/firebase/firebase_crud_operations/crud_operations.dart';
import 'package:fitness_app/screens/main_screen/main_screen.dart';
import 'package:fitness_app/screens/sign_in/sign_in_screen.dart';
import 'package:fitness_app/screens/sign_up/user_form_screen.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../firebase/firebase_riverpord/firebase_riverpord.dart';
import '../../ui_models/welcome_screen_model.dart';
import '../../ui_widgets/button_widget.dart';
import '../../ui_widgets/textformfield_widget.dart';
import '../acoount_feature/sub_screens/linked_account_feature/model.dart';

class SignUpScreen extends ConsumerWidget {
   SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   final _checkBox=StateProvider<bool>((ref)=>false);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //StateChecker.checkFirebaseAuthState(context, ref);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.secondaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Join TrackFit Today 👤", isBold: true, fontSize: 31),
                TextWidget(text: "Create your account and start tracking your steps.", fontSize: 18),
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 10),
                      TextWidget(text: "Email", fontSize: 18),
                      TextFieldWidget(
                        leadingIcon: CustomIcons.message,
                        controller: _emailController,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Email',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required*';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextWidget(text: "Password", fontSize: 18),
                      TextFieldWidget(
                        leadingIcon: Icons.lock,
                        controller: _passwordController,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required*';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      side: BorderSide(color: AppColor.primaryColor, width: 2.0),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 18),
                        children: [
                          TextSpan(text: "I agree to the ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                          TextSpan(text: "Terms & Conditions.", style: TextStyle(color: AppColor.primaryColor)),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => SignInScreen()));
                        },
                        child: Text("Sign in", style: TextStyle(color: AppColor.primaryColor)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    TextWidget(text: "   or   "),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 10),
                ... List.generate(2, (index){
                  return ButtonWidget(
                    color: Colors.white,
                    isBorder: true,
                    onPress: () async {
                      if (index == 0) {
                      bool val= await ref.read(loginControllerProvider.notifier).continueWithGoogle();
                      if(val){
                        bool temp=await ref.read(firebaseCRUDProvider).documentExists("users", ref.watch(currentUserProvider)!.uid);
                        print("Document exists: $temp");
                       if(temp){
                         Navigator.pushAndRemoveUntil(
                           context,
                           MaterialPageRoute(builder: (context) => MainScreen()),
                               (route) => false,
                         );
                       }else{
                         Navigator.pushAndRemoveUntil(
                           context,
                           MaterialPageRoute(builder: (context) => UserFormScreen()),
                               (route) => false,
                         );
                       }
                        return;
                      }
                      else{
                        TransitionAnimation.navigator(context, UserFormScreen());
                       }
                      }
                    },
                    widget: Row(
                      spacing: 40,
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
                        TextWidget(text: WelcomeScreenModel.list[index].title, isBold: true),
                      ],
                    ),
                  );
                }),
                SizedBox(height: 20),
                ButtonWidget(
                  onPress: ()  {
                    bool? isValid = _formKey.currentState?.validate();
                    print("Form Validation Result: $isValid");
                    if (_formKey.currentState!.validate()){
                      //why not entered in this block
                      try{
                        ref.read(loginControllerProvider.notifier).createUserWithEmailAndPassword(_emailController.text, _passwordController.text);
                      }catch(e){
                        print(e);
                      }
                    }
                  },
                  title: "Sign up",
                  color: AppColor.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
