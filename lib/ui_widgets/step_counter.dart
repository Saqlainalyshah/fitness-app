import 'package:fitness_app/app_color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StepCounter extends ConsumerWidget {
   StepCounter({super.key});
  final int currentSteps = 6496;  // Example step count
  final int goalSteps = 6000;
  final _isPlayed=StateProvider.autoDispose<bool>((ref)=>false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [ // Create a secondary radial axis for segmented line
          SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
              maximum: 6000,
              showLabels: false,
              showTicks: false,
              pointers: <GaugePointer>[
                RangePointer(
                  color:  AppColor.primaryColor,
                  value: 4000,
                  cornerStyle: CornerStyle.bothCurve,
                  width: 0.2,
                  sizeUnit: GaugeSizeUnit.factor,
                )
              ],
              axisLineStyle: AxisLineStyle(
                thickness: 0.2,
                cornerStyle: CornerStyle.bothCurve,
                color: Colors.grey.shade300,
                thicknessUnit: GaugeSizeUnit.factor,
              ),
            )
          ]),
          PositionedDirectional(
            top: 80,
            child: Column(
              spacing: 5,
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                Text(
                  'Steps',
                  style: TextStyle(fontSize: 15,color: Colors.grey.shade700),
                ),
                Text(
                  '$currentSteps',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
                ),
                Text(
                  '/$goalSteps Steps',
                  style: TextStyle(fontSize: 15,color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(

                  interval: 1,
                  maximum: 15,
                  showLabels: false,
                  showAxisLine: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Colors.purple,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  offsetUnit: GaugeSizeUnit.factor,
                  minorTickStyle: MinorTickStyle(length: 5,thickness: 1.5,color: Colors.grey),
                  radiusFactor: 0.7,
                  majorTickStyle: MajorTickStyle(
                      length: 8,
                      thickness:1.5,
                      // lengthUnit: GaugeSizeUnit,
                      color: Colors.white),
                )
              ]

          ),
          IconButton(onPressed: (){
            ref.read(_isPlayed.notifier).state=!ref.watch(_isPlayed);
          }, icon: Icon(ref.watch(_isPlayed)?Icons.play_circle:Icons.pause_circle_outline,color: AppColor.primaryColor,size: 50,)),
        ],
      ),
    );
  }
}
