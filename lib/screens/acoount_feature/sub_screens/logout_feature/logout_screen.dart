import 'package:fitness_app/firebase/firebase_riverpord/firebase_riverpord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_color/color.dart';
import '../../../../ui_widgets/basic_widgets.dart';
import '../../../../ui_widgets/button_widget.dart';
import '../../../../ui_widgets/text_widget.dart';
import '../../../welcome/welcome_screen.dart';

Future logoutPopUp(BuildContext context, WidgetRef ref){
  return  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    backgroundColor: AppColor.secondaryColor,
    builder: (context) {
      return Container(
        //height: 200,
        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 40),
        decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          spacing: 30,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(
              text: "Logout",
              color: Colors.red,
              fontSize: 20,
              isBold: true,
            ),
            DividerWidget(),
            TextWidget(
              text: "Are you sure you want to log out?",
              // isBold: true,
              fontSize: 18,
            ),
            DividerWidget(),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ButtonWidget(
                    onPress: () {
                      Navigator.pop(context);
                    },
                    title: "Cancel",
                    color: AppColor.optionalColor,
                    titleColor: AppColor.primaryColor,
                  ),
                ),
                Expanded(
                  child: ButtonWidget(
                    onPress: () {
                      ref.read(loginControllerProvider.notifier).logOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()),
                            (route) => false,
                      );
                      },
                    title: "Yes, Logout",
                  ),
                ),
              ],
            ),
            SizedBox(height: 2,)
          ],
        ),
      );
    },
  );
}