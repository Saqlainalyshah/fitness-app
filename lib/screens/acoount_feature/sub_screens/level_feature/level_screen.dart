import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'level_up_event.dart';
final levelUpProvider=StateProvider.autoDispose<bool>((ref)=>false);
class LevelScreen extends ConsumerWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: AppColor.secondaryColor,)),
        backgroundColor: AppColor.primaryColor,
        title: TextWidget(text: "Achievements",color: AppColor.secondaryColor,isBold: true,),
        centerTitle: true,
      ),
       body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height*0.4,
              color: AppColor.primaryColor,
              child: Column(
                spacing: 5,
                children: [
                  Image.asset("assets/images/level/level9.png",height: 200,),
                  TextWidget(text: "Level 9",isBold: true,fontSize: 20,color: AppColor.secondaryColor,),
                  TextWidget(text: "You've passed 200,000 steps!",color: AppColor.secondaryColor,),

                ],
              ),
            )
          ],
        ),
          Container(
            height: MediaQuery.sizeOf(context).height*0.56,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(), // Prevents nested scrolling issues
              itemCount: 15,
              padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 items per row
                mainAxisSpacing: 10, // Vertical spacing
                crossAxisSpacing: 10, // Horizontal spacing
                childAspectRatio: 1, // Adjust for proper layout
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    showAchievementDialog(context,index);
                    if(index==9){
                      ref.watch(levelUpProvider.notifier).state=true;
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Image.asset( index<9?"assets/images/level/level${index+1}.png":"assets/images/ui/lock-level.png", )), // Adjust size if needed
                      TextWidget(text: "Level ${index + 1}", fontSize: 15, isBold: true),
                      TextWidget(text: "You've passed this level", fontSize: 10),
                    ],
                  ),
                );
              },
            ),

          )

        ]
      )
    );
  }
}

