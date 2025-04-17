import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/ui_models/home_screen_model.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/icon__text_data_widget.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ui_widgets/dropdown_widget.dart';
import '../../ui_widgets/step_counter.dart';


class _HomeScreenData{
  late final List<String> dropDownList;
  late final List<String> weeklyProgress;
  late final String progressValue;

  _HomeScreenData({required this.dropDownList,required this.weeklyProgress, required this.progressValue});
  _HomeScreenData copyWith({
     final List<String>? dropDownList,
     final List<String>? weeklyProgress,
    final String? progressValue,
}){
   return _HomeScreenData(dropDownList: dropDownList?? this.dropDownList, weeklyProgress: weeklyProgress?? this.weeklyProgress,progressValue: progressValue?? this.progressValue );
  }
}


final homeScreenStatesProvider=StateProvider<_HomeScreenData>((ref){
  final List<String> _dropDownList=  ['Today','This Week', 'This Month','Last Month','Last 6 Month','This Year','Last year','All Time','Custom Range'];
  return _HomeScreenData(
      dropDownList: _dropDownList,
      weeklyProgress: ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],
      progressValue:_dropDownList.first
  );
});

class HomeScreen extends ConsumerWidget {
   HomeScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build");

    final weeklyProgress=ref.watch(homeScreenStatesProvider.select((state)=>state.weeklyProgress));


    return SingleChildScrollView(
      child: Column(
        spacing: 20,
        children: [
          SizedBox(height: 10,),

          Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.sizeOf(context).height * 0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.secondaryColor),
            child: StepCounter(),
          ),
          Container(
            padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index){
                  return IconTextDataWidget(index: index,
                      iconsList: homeScreenThreeIconsList,
                      titleList: homeScreenTitleList,
                      dataList: homeScreenDataList,

                  );
                }),
              )),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.25,
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
                        builder:(context,ref,child){
                          print("dropdown");
                          final dropDownList=ref.watch(homeScreenStatesProvider.select((state)=>state.dropDownList));
                          final progressValue= ref.watch(homeScreenStatesProvider.select((state)=>state.progressValue));
                          return DropdownWidget(
                            value: progressValue,
                            list: dropDownList,
                            onChanged: (String? value) {
                            final stateChange=  ref.read(homeScreenStatesProvider.notifier);
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
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 10),
      
                    itemCount: weeklyProgress.length,
                    itemBuilder: (context,index){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  // padding: EdgeInsets.only(left: 10),
                                  color: AppColor.primaryColor,
                                  backgroundColor: Colors.grey.shade400,
                                  value: 0.5,),
                              ),
                              TextWidget(text: '43',isBold: true,),
                            ],
                          ),
                          TextWidget(text: weeklyProgress[index],isBold: true,color: Colors.grey.shade700,),
                        ],
                      );
                    },
                    separatorBuilder: (context,index){
                      return Padding(padding: EdgeInsets.all(10));
                    },
      
                  ),
                ),
                //DateSelectorWidget()
              ],
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}

