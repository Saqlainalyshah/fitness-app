import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_color/color.dart';

///Button widget
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.isLoading = false,
    this.isBorder = false,
    this.title,
this.isBold=true,
    this.widget,
    this.fontSize = 14.0,
    this.radius = 30.0,
    this.width = double.infinity,
    this.height = 60.0,
    this.color = const Color(0xff7F27FF),
    this.titleColor = Colors.white,
    required this.onPress,
  });
  final bool isLoading;
  final bool isBorder;
  final bool isBold;
  final String? title;
  final Widget? widget;
  final double fontSize;
  final double height;
  final double width;
  final Color titleColor;
  final double radius;
  final Color color;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        onPress();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color,
            border: isBorder?Border.all(
              color: Colors.grey.shade300
            ):null),
        child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: AppColor.secondaryColor,
                  )
                : title==null? widget: TextWidget(
                  text: title.toString(),
                  color: titleColor,
                  fontSize: fontSize,
                  isBold: isBold,
                )),
      ),
    );
  }
}
