import 'package:fitness_app/app_color/color.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key,
  required this.value,
    required this.onChanged,
  });
final bool value;
  final ValueChanged<bool?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged:onChanged,
      activeColor: Colors.white,
      inactiveThumbColor: Colors.white,
      activeTrackColor: AppColor.primaryColor,
      inactiveTrackColor: const Color(0xffC4C5D3),
      splashRadius: 0.0,
    );
  }
}
