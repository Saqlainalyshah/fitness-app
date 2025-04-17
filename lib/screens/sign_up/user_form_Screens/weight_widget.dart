

import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/span_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../ui_models/sign_up_user_data_model.dart';
import '../../../ui_widgets/listwheelscrooll_widget.dart';
import '../../../ui_widgets/text_widget.dart';


final weight=StateProvider<int>((ref)=>0);
final weightType=StateProvider<String>((ref)=>"");
class WeightWidget extends ConsumerWidget {
   WeightWidget({super.key});
 final  List<String> list=['kg','Ibs'];
   final _value=StateProvider.autoDispose<int>((ref)=>0);
   final _index=StateProvider<int>((ref)=>0);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final currentIndex = ref.watch(_index);
    final selectedWeight = ref.watch(_value);

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpanTextWidget(simpleText: "What's Your", spanText: " Weight ",),
        TextWidget(text: "Share your weight with us.",fontSize: 19,),
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children:List.generate(2, (index){
            return ButtonWidget(
              width: 50,
              height: 40,
              onPress: (){
               ref.watch(weightType.notifier).state=index==0?"kg":"Ibs";
                ref.read(_index.notifier).state=index;
              },title:list[index] ,
              isBorder: true,
              titleColor:ref.watch(_index)==index?AppColor.secondaryColor:Colors.black ,
              color: ref.watch(_index)==index?AppColor.primaryColor:Colors.white,
            );
          }),),
        SizedBox(height: 20,),
        ListWheelScrollWidget(
            padding: 10,
            range: 1,
            value:selectedWeight,
            onSelectedItemChanged: (index){
            int newValue = (currentIndex == 0) ? 40 + index : 80 +index;
              ref.read(_value.notifier).state=newValue;
              ref.read(weight.notifier).state= selectedWeight;
            },
            minValue:currentIndex==0?40:80,
            maxValue:currentIndex==0? 300:660,
            text: currentIndex==0?" kg":" Ibs"
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}