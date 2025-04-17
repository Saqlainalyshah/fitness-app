import 'package:fitness_app/app_color/color.dart';
import 'package:flutter/material.dart';


/// Text Field Widget
class TextFieldWidget extends StatelessWidget {
  // Constructor
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.leadingIcon,
    this.trailingIcon,
    this.fillColor = const Color(0xFFFAFAFA),
    this.textInputType = TextInputType.text,
    this.secure = false,
    this.radius = 10,
    this.isLengthOne=false,
    this.hintText = " ",
    this.isBorder = false,
    this.labelText,
    this.onChanged,
    this.trailingFn,
    this.validator, // Added validator function
  });

  final bool secure;
  final String? labelText;
  final bool isBorder;
  final bool isLengthOne;
  final String hintText;
  final double radius;
  final TextInputType textInputType;
  final Color fillColor;
  final TextEditingController controller;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final void Function(String)? onChanged;
  final Function? trailingFn;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      keyboardType: textInputType,
      obscureText: secure,
      maxLength: isLengthOne?1:null,
      controller: controller,
      onChanged: onChanged,
      validator: validator, // Pass the function as an argument
      decoration: InputDecoration(
        counterText: '',
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: isBorder
              ? const BorderSide(
            color: Colors.grey,
          )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColor.primaryColor
          )
        ),
        filled: true,
        fillColor: fillColor,
        prefixIcon: leadingIcon == null
            ? null
            : Icon(leadingIcon, color: Colors.black54, size: 25.0),
        suffixIcon: trailingIcon != null
            ? GestureDetector(
          onTap: () {
            if (trailingFn != null) {
              trailingFn!(); // Invoke the function when the trailing icon is tapped
            }
          },
          child: Icon(trailingIcon, color: Colors.black38, size: 25.0),
        )
            : null,
        hintText: hintText,
      ),
    );
  }
}
