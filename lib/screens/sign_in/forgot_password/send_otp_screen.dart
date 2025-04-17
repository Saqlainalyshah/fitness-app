import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/firebase/firebase_riverpord/firebase_riverpord.dart';
import 'package:fitness_app/ui_widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_color/color.dart';
import '../../../ui_widgets/button_widget.dart';
import '../../../ui_widgets/text_widget.dart';
import '../../../ui_widgets/textformfield_widget.dart';
import 'otp_received_screen.dart';

class SendOtpScreen extends ConsumerWidget {
  SendOtpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(  backgroundColor: AppColor.secondaryColor,),
        backgroundColor: AppColor.secondaryColor,
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            spacing: 20,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              TextWidget(text: "Forgot Your Password? 🔑 ",isBold: true,fontSize: 31,),
              TextWidget(text: "Enter the email associated with your TrackFit account below. We'll send you a one-time passcode (OTP) to reset your password.",fontSize: 18,),
              Form(
                key: _formKey, // ✅ Wrap TextFormField in Form widget
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Your Registered Email",fontSize: 17,isBold: true,),
                    TextFieldWidget(
                      leadingIcon: CustomIcons.message,
                      controller: controller,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          color: AppColor.secondaryColor,
          padding: EdgeInsets.all(10.0),
          child:   ButtonWidget(onPress: (){
      bool a =FirebaseAuth.instance.currentUser!.emailVerified;






           /* Navigator.push(context, MaterialPageRoute(builder: (builder)=>OtpReceivedScreen()));*/
          },title: "Send OTP Code",
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
