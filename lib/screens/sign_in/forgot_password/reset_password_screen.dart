

import 'package:fitness_app/screens/sign_in/forgot_password/reset_password_successful_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_color/color.dart';
import '../../../ui_widgets/button_widget.dart';
import '../../../ui_widgets/text_widget.dart';
import '../../../ui_widgets/textformfield_widget.dart';

class ResetPasswordScreen extends ConsumerWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController controller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.secondaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.secondaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(5.0),
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(text: "Secure Your Account 🔒",isBold: true,fontSize: 31,),
                TextWidget(text: "Choose a new password for your TrackFit account. Make sure it's secure and easy to remember.",fontSize: 18,),
                Form(
                  key: _formKey, // ✅ Wrap TextFormField in Form widget
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      TextWidget(text: "New Password",fontSize: 18,),
                      TextFieldWidget(
                        controller: controller,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          return '';
                        },
                      ),
                      TextWidget(text: "Confirm New Password",fontSize: 18,),
                      TextFieldWidget(
                        fillColor: Colors.grey.shade200,
                        controller: controller,
                        hintText: 'Confirm Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is wrong';
                          }
                          return '';
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
            color: AppColor.secondaryColor,
            padding: EdgeInsets.all(10.0),
            child:   ButtonWidget(onPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>ResetPasswordSuccessfulScreen()));
            },title: "Save New Password",
              color: AppColor.primaryColor,
              isBold: false,
              fontSize: 18,
            )
        ),
      ),
    );
  }
}
