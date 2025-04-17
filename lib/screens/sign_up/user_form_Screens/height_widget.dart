import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_color/color.dart';
import '../../../ui_models/sign_up_user_data_model.dart';
import '../../../ui_widgets/button_widget.dart';
import '../../../ui_widgets/listwheelscrooll_widget.dart';
import '../../../ui_widgets/span_text_widget.dart';
import '../../../ui_widgets/text_widget.dart';

final height=StateProvider<int>((ref)=>0);
final heightUnit=StateProvider<String>((ref)=>'');
class HeightWidget extends ConsumerWidget {
   HeightWidget({super.key});
  final _value = StateProvider.autoDispose<int>((ref) => 0);
  final _currentIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(_currentIndexProvider); // Watch state once
    final selectedValue = ref.watch(_value); // Watch height value

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpanTextWidget(simpleText: "What's Your", spanText: " Height "),
        TextWidget(text: "How tall are you?", fontSize: 19),
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            List<String> list = ['cm', 'ft'];
            return ButtonWidget(
              width: 50,
              height: 40,
              onPress: () {
                ref.read(_currentIndexProvider.notifier).state = index;
               ref.read(heightUnit.notifier).state=index==0?"cm":"ft";
              },
              title: list[index],
              isBorder: true,
              titleColor: currentIndex == index ? AppColor.secondaryColor : Colors.black,
              color: currentIndex == index ? AppColor.primaryColor : Colors.white,
            );
          }),
        ),
        const SizedBox(height: 20),
        ListWheelScrollWidget(
          padding: 10,
          range: 1,
          value: selectedValue,
          onSelectedItemChanged: (index) {
            int newValue = (currentIndex == 0) ? 30 + index : 1 + index;
            ref.read(_value.notifier).state = newValue;
            ref.read(height.notifier).state= ref.watch(_value);
          },
          minValue: currentIndex == 0 ? 30 : 1,
          maxValue: currentIndex == 0 ? 300 : 15,
          text: currentIndex == 0 ? " cm" : " ft",
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
