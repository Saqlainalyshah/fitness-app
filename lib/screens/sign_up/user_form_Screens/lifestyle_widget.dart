
import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/span_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../ui_models/sign_up_user_data_model.dart';
import '../../../ui_widgets/text_widget.dart';

final lifeStyle=StateProvider<bool>((ref)=>false);
final _index=StateProvider((ref)=>0);
class LifeStyleWidget extends StatelessWidget {
  const LifeStyleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpanTextWidget(simpleText: "Do you live a ", spanText: "Sedentary ",afterSpanText: "Lifestyle?",),
        TextWidget(text: "Tell us about your daily routine.",fontSize: 19,),
        Image.asset("assets/images/gender/lifestyle.png",height: MediaQuery.sizeOf(context).height*0.4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:List.generate(2, (index){
            List<String> list=['No','Yes'];
            return  Consumer(
              builder: (context,ref,child)=>ButtonWidget(
                width: 60,
                onPress: (){
                  ref.watch(_index.notifier).state=index;
                  ref.read(lifeStyle.notifier).state= index==0?false:true;
                },
                title: list[index],
                titleColor:  ref.watch(_index)==index?AppColor.secondaryColor:Colors.black,
                isBorder:  ref.watch(_index)==index?false:true,
                color: ref.watch(_index)==index?AppColor.primaryColor:AppColor.secondaryColor,
              ),
            );
          }),
        ),
      ],
    );
  }
}