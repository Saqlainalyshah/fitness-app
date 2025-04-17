import 'package:flutter/material.dart';
import '../app_color/color.dart';

class ListWheelScrollWidget extends StatelessWidget {
  const ListWheelScrollWidget({super.key,
    required this.value,
    required this.onSelectedItemChanged,
    required this.minValue,
    required this.maxValue,
    required this.padding,
    required this.text,
    this.range=1,
  });

  final int value;
  final Function(int)? onSelectedItemChanged;
  final int minValue;
  final int maxValue;
  final double padding;
  final String text;
  final int range;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // **TOP & BOTTOM SEPARATOR LINES**
        Positioned(
          top: MediaQuery.of(context).size.height*0.29,
          child: Container(
            width: 120,
            height: 2,
            color: AppColor.primaryColor,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height*0.29,
          child: Container(
            width: 120,
            height: 2,
            color: AppColor.primaryColor,
          ),
        ),

        ShaderMask(
          shaderCallback: (Rect bounds)=>RadialGradient(
              center: Alignment.topCenter,
              stops: [0.1,1.0,],
              tileMode: TileMode.mirror,
              colors: [
                Colors.grey.shade400.withOpacity(0.5),
                Colors.white
              ]
          ).createShader(bounds),
          child: SizedBox(
            height:MediaQuery.sizeOf(context).height*0.5,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              physics: const FixedExtentScrollPhysics(),
              controller: FixedExtentScrollController(initialItem:4),
              perspective: 0.006,
              diameterRatio: 5.5,
              onSelectedItemChanged: onSelectedItemChanged,
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  int result = minValue + (index * range);
                  if (result > maxValue) return null;
                  bool isSelected = result == value;
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: isSelected?padding:0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "$result",
                          style: TextStyle(
                            fontSize: isSelected ? 30:20,
                            fontWeight: FontWeight.bold ,
                            color: isSelected ? Colors.purple : Colors.black,
                          ),
                          children: isSelected
                              ? [
                            TextSpan(
                              text: text,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ]
                              : [],
                        ),
                      ),
                    ),
                  );
                },
                childCount: ((maxValue - minValue) ~/ range) + 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
