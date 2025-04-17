import 'package:flutter/material.dart';

import '../app_color/color.dart';

class SpanTextWidget extends StatelessWidget {
  const SpanTextWidget({super.key,
  required this.simpleText,
    required this.spanText,
    this.afterSpanText,
  });
  final String simpleText;
  final String spanText;
  final String? afterSpanText;
  @override
  Widget build(BuildContext context){
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,),  // ✅ Ensures text inherits proper styling
        children: [
          TextSpan(
            text: simpleText,
            style: TextStyle(color: Colors.black,),
          ),
          TextSpan(
            text: spanText,
            style: TextStyle(color: AppColor.primaryColor, ),
          ),
          if(afterSpanText!=null)TextSpan(
            text:  afterSpanText,
            style: TextStyle(color: Colors.black,),
          ),
        ],
      ),
    );
  }
}
