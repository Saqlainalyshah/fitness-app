import 'package:flutter/material.dart';

///Text Widget

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color color;
  final bool isBold;
  final int? maxLines;
  final TextAlign? textAlign;
  const TextWidget({
    super.key,
    required this.text,
    this.textAlign=TextAlign.start,
    this.maxLines=300,
    this.fontSize,
    this.color = Colors.black,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      softWrap: true,
      maxLines:maxLines,
      textAlign: textAlign,
      style: TextStyle(

        color: color,
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
