import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fitness_app/animations/transition.dart';
import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/firebase/auth/state_checker.dart';
import 'package:fitness_app/local_auth/local_authstate_check.dart';
import 'package:fitness_app/riverpord/global_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app_color/color.dart';
import '../firebase/auth/auth_checker.dart';
import '../firebase/firebase_riverpord/firebase_riverpord.dart';
import '../internet_connection/internet_connection.dart';
import '../local_auth/local_auth.dart';
import '../local_auth/local_states.dart';
import '../ui_widgets/button_widget.dart';
import '../ui_widgets/text_widget.dart';


class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 300.0),
                child: Column(
                  spacing: 10,
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          CustomIcons.app,size: 150,color: AppColor.secondaryColor,
                        )
                    ),
                    TextWidget(text: "TrackFit",fontSize: 30,isBold: true,color: AppColor.secondaryColor,),
                  ],
                ),
              ),
             Padding(
               padding: const EdgeInsets.only(top: 250.0),
               child: Column(
                 spacing: 10,
                 children: [
                   CircularProgressIndicator(
                     color: AppColor.secondaryColor,
                   ),
                   RichText(
                     textAlign: TextAlign.center,
                     text: TextSpan(
                       children: [
                         TextSpan(
                           text: "Health care Mobile App from",
                           style: TextStyle(color: Colors.white,),
                         ),
                         TextSpan(
                           text: " @Saqlain Ali Shah",
                           style: TextStyle(color: AppColor.secondaryColor, fontWeight: FontWeight.bold,),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
