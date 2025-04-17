
import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/icon__text_data_widget.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app_color/color.dart';
import '../../ui_models/home_screen_model.dart';
import '../../ui_widgets/calendar_widget.dart';
import '../../ui_widgets/dropdown_widget.dart';
import '../home/home_screen.dart';
class ReportScreen extends ConsumerWidget {
   ReportScreen({super.key});


  final _index=StateProvider<int>((ref)=>0);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    print("build");
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 20,
          children: [
            Container(
              padding: EdgeInsets.all(20),
             // height: MediaQuery.sizeOf(context).height * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondaryColor),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    spacing: 15,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CustomIcons.app,color: AppColor.primaryColor,),
                      TextWidget(text: "256,480",isBold: true,fontSize: 32,),
                    ],
                  ),
                  TextWidget(text: "Total steps all the time"),
                  DividerWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index){
                    return IconTextDataWidget(
                        index: index,
                        iconsList: homeScreenThreeIconsList,
                        titleList: homeScreenTitleList,
                        dataList: homeScreenDataList,

                    );
                    }),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondaryColor),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Statistics",
                          isBold: true,
                          fontSize: 20,
                        ),
                        Consumer(
                          builder:(context,ref,child) {
                            final dropDownList=ref.watch(homeScreenStatesProvider.select((state)=>state.dropDownList));
                            final selectedValue=ref.watch(homeScreenStatesProvider.select((state)=>state.progressValue));
                            return DropdownWidget(
                              value: selectedValue,
                              list: dropDownList,
                              onChanged: (String? value) {
                                final stateChange=ref.watch(homeScreenStatesProvider.notifier);
                                stateChange.state=stateChange.state.copyWith(progressValue: value);
                              },
                            );
                          }
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DividerWidget(height: 0,),
                  ),
                  Row(
                    children: List.generate(4, (index){
                      List<String> list=['Steps','Time','Calorie','Distance',];
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer(builder: (context,ref,child)=>ButtonWidget(
                            isBorder:  ref.watch(_index)==index?false:true,
                            color: ref.watch(_index)==index?AppColor.primaryColor:AppColor.secondaryColor,
                            height: 35,
                            onPress: (){
                              ref.read(_index.notifier).state=index;
                            },
                            title: list[index],
                            titleColor: ref.watch(_index)==index?AppColor.secondaryColor:Colors.black,
                          )),
                        ),
                      );
                    }),
                  ),
                  //DateSelectorWidget()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
             // height: MediaQuery.sizeOf(context).height * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondaryColor),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Your Progress",
                          isBold: true,
                          fontSize: 20,
                        ),
                        Consumer(
                            builder:(context,ref,child) {
                              final dropDownList=ref.watch(homeScreenStatesProvider.select((state)=>state.dropDownList));
                              final selectedValue=ref.watch(homeScreenStatesProvider.select((state)=>state.progressValue));
                              return DropdownWidget(
                                value: selectedValue,
                                list: dropDownList,
                                onChanged: (String? value) {
                                  final stateChange=ref.watch(homeScreenStatesProvider.notifier);
                                  stateChange.state=stateChange.state.copyWith(progressValue: value);
                                },
                              );
                            }
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DividerWidget(height: 0,),
                  ),

                  CalendarWidget(),
                  //DateSelectorWidget()
                ],
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
