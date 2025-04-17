
import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ui_widgets/button_widget.dart';

class TrackScreen extends ConsumerWidget {
   TrackScreen({super.key});
  final _index=StateProvider.autoDispose<int>((red)=>0);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text("Google Maps"),)),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: ref.watch(_index) == 1?
      ButtonWidget(
          onPress: () {
            _buildBottom(context,ref);
          },
          title: "Start")
          : null,
    );
  }
}
PersistentBottomSheetController _buildBottom(BuildContext context,WidgetRef ref){
  return showBottomSheet(
      context: context,
      backgroundColor: AppColor.secondaryColor,
      enableDrag: false,

      sheetAnimationStyle: AnimationStyle(reverseCurve: Curves.ease,curve: Curves.bounceIn,),
      showDragHandle: false,
      builder: (context,) {
        List<Icon>icons=[
          Icon(Icons.directions_walk,color: Colors.blue,),
          Icon(CustomIcons.time_circle,color: Colors.orange,),
          Icon(CustomIcons.kcl,color: Colors.red,),
          Icon(CustomIcons.location,color: Colors.green,),
        ];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,height: 4,
                decoration: BoxDecoration(
                color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)
                ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (index) {
                  List<String> list=["steps","time","kcal","km"];
                  if (index.isEven) {
                    switch(index){
                      case 0:index=0;
                      case 2:index=1;
                      case 4:index=2;
                      case 6:index=3;
                    }

                    return Column(
                      spacing: 10,
                      children: [
                        icons[index],
                        TextWidget(text: "4805", isBold: true),
                        TextWidget(text: list[index]),
                      ],
                    );
                  } else {
                    return SizedBox(height: MediaQuery.sizeOf(context).height*0.1,child: VerticalDivider());
                  }
                }),
              ),
              ButtonWidget(onPress: (){
                Navigator.pop(context);
              }
                ,title: "Stop",
                fontSize: 18,
                color: AppColor.optionalColor,
                titleColor: AppColor.primaryColor,
              )
            ],
          ),
        );
      });
}