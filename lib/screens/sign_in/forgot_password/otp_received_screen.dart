import 'dart:async';

import 'package:fitness_app/screens/sign_in/forgot_password/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_color/color.dart';
import '../../../ui_widgets/button_widget.dart';
import '../../../ui_widgets/text_widget.dart';
import '../../../ui_widgets/textformfield_widget.dart';


class CountdownNotifier extends StateNotifier<int> {
  CountdownNotifier() : super(30) {
    _startCountdown();
  }

  void _startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        timer.cancel();
      }
    });
  }
  void restartCountdown() {
    state = 30; // Reset to initial value
    _startCountdown();
  }
}


class OtpReceivedScreen extends ConsumerWidget {
   OtpReceivedScreen({super.key});
final TextEditingController controller=TextEditingController();
   final _counter = StateNotifierProvider.autoDispose<CountdownNotifier, int>(
         (ref) => CountdownNotifier(),
   );
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
                TextWidget(text: "Enter OTP Code 🔐 ",isBold: true,fontSize: 31,),
                TextWidget(text: "Check your email inbox for a one-time passcode (OTP) from TrackFit. Enter the code below to continue.",fontSize: 18,),
                Row(
                  spacing: 10,
                  children: [
                  Expanded(
                    child: TextFieldWidget(
                      isLengthOne: true,
                      controller: controller,
                      textInputType: TextInputType.number,
                      fillColor: Colors.grey.shade200,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return '';
                      },
                    ),
                  ),
                  Expanded(child: TextFieldWidget(
                    controller: controller,
                    isLengthOne: true,
                    textInputType: TextInputType.number,
                    fillColor: Colors.grey.shade200,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid email';
                      }
                      return '';
                    },
                  ),),
                  Expanded(
                    child: TextFieldWidget(
                      isLengthOne: true,

                      controller: controller,
                      textInputType: TextInputType.number,
                      fillColor: Colors.grey.shade200,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return '';
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      isLengthOne: true,

                      controller: controller,
                      textInputType: TextInputType.number,
                      fillColor: Colors.grey.shade200,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return '';
                      },
                    ),
                  ),

                ],
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 18),  // ✅ Ensures text inherits proper styling
                      children: [
                        TextSpan(
                          text: "You can resend the code in",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: ' ${ref.watch(_counter)}',
                          style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.w500 ),
                        ),
                        TextSpan(
                          text: " seconds",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonWidget(onPress: (){
                  if(ref.watch(_counter)==0){
                    ref.read(_counter.notifier).restartCountdown();

                  }


                },
                title: "Resend code",
                  color:ref.watch(_counter)==0? AppColor.primaryColor:Colors.transparent,
                  titleColor: ref.watch(_counter)==0? AppColor.secondaryColor:Colors.black,
                  isBold: false,
                  fontSize: 18,

                )
              ],
            ),
          ),
        ),
        bottomSheet: ref.watch(_counter)!=0?Container(
          color: AppColor.secondaryColor,
          padding: EdgeInsets.all(10.0),
          child:   ButtonWidget(onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>ResetPasswordScreen()));
          },title: "Verify OTP",
            color: AppColor.primaryColor,
            //isBold: false,

          )
        ):null,
           ),
     );
  }
}
