import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key,
  this.height=0.0,
  });
final double height;
  @override
  Widget build(BuildContext context) {
    return  Divider(
      height: height,
    );
  }
}
