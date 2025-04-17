import 'package:country_picker/country_picker.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
/// 5) Phone Number Text Field
final countryCodeProvider=StateProvider<Country>((ref)=>Country(
  phoneCode: "92",
  countryCode: "PK",
  e164Sc: 0,
  geographic: true,
  level: 1,
  name: "Pakistan",
  example: "Pakistan",
  displayName: "Pakistan",
  displayNameNoCountryCode: "PK",
  e164Key: "",
));

class PhoneTextField extends ConsumerWidget {
  const PhoneTextField(
      {super.key,
        required this.controller,
        required this.onChanged,
        this.isBorder = false,
        this.radius = 10.0,
        this.fillColor = Colors.white});

  final TextEditingController controller;
  final Function(String) onChanged;
  final bool isBorder;
  final double radius;
  final Color fillColor;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: isBorder
              ? const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:isBorder
              ? const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          )
              : BorderSide
              .none, // Remove the underline when the field is enabled
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: isBorder
              ? const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(radius),
        ),
        hintText: "Enter phone number",
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: fillColor,
        prefixIcon: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.2, // Adjusted width
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize:
            MainAxisSize.max, // Ensures Row takes only the necessary space
            children: [
              TextWidget(
                text: ref.watch(countryCodeProvider).flagEmoji,
                isBold: true, // Optionally bold for better readability
              ),
              InkWell(
                onTap: () {
                  showCountryPicker(
                      context: context,
                      onSelect: (value) {
                        ref.read(countryCodeProvider.notifier).state=value;
                      },
                      countryListTheme: const CountryListThemeData(
                          margin: EdgeInsets.all(10.0),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          bottomSheetHeight: 400));
                },
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}