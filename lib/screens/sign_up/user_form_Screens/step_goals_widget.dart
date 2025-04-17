import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../firebase/firebase_crud_operations/crud_operations.dart';
import '../../../firebase/firebase_riverpord/firebase_riverpord.dart';
import '../../../model_classes/user.dart';
import '../../../ui_models/sign_up_user_data_model.dart';
import '../../../ui_widgets/listwheelscrooll_widget.dart';
import '../../../ui_widgets/span_text_widget.dart';
import '../../../ui_widgets/text_widget.dart';

final stepGoals=StateProvider<int>((ref)=>0);
class StepGoalsWidget extends StatelessWidget {
   StepGoalsWidget({super.key});
  final _value=StateProvider<int>((ref)=>1000);
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpanTextWidget(simpleText: "Set Your", spanText: " Step Goal ",),
        TextWidget(text: "Choose your daily step goal to stay motivated!",fontSize: 17,),
        SizedBox(height: 20,),
        Consumer(
          builder:(context,ref,child)=> ListWheelScrollWidget(
              range: 500,
              padding: 20,
              value: ref.watch(_value),
              onSelectedItemChanged: (index){
                  ref.watch(_value.notifier).state=1000+(index*500);
                  ref.read(stepGoals.notifier).state= ref.watch(_value);
              },
              minValue:1000,
              maxValue: 50000,
              text: " steps"
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}