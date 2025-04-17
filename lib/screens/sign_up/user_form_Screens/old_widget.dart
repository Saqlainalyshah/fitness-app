
import 'package:fitness_app/ui_widgets/span_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../ui_models/sign_up_user_data_model.dart';
import '../../../ui_widgets/listwheelscrooll_widget.dart';
import '../../../ui_widgets/text_widget.dart';
final age=StateProvider<int>((ref)=>0);
class OldWidget extends StatelessWidget {
   OldWidget({super.key});
  final _age=StateProvider.autoDispose<int>((ref)=>10);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpanTextWidget(simpleText: "How", spanText: " Old",afterSpanText: " Are your?",),
        TextWidget(text: "Share your age with us.",fontSize: 19,),
        SizedBox(height: 20,),
        Consumer(
          builder:(context,ref,child)=> ListWheelScrollWidget(
            padding: 40,
              range: 1,
              value: ref.watch(_age),
              onSelectedItemChanged: (index){
                ref.watch(_age.notifier).state=10+index;
                ref.read(age.notifier).state= ref.watch(_age);
              },
              minValue: 10,
              maxValue: 100,
              text: " years"
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}