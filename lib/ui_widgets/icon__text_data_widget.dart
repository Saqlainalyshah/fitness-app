import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:flutter/material.dart';
class IconTextDataWidget extends StatelessWidget {
    IconTextDataWidget({super.key,
    required this.index,
    required this.iconsList,
    required this.titleList,
    required this.dataList,
  });
   int index;
  final List<Icon> iconsList;
  final List<String> titleList;
  final List<String> dataList;

  @override
  Widget build(BuildContext context) {
    if(index.isEven){
      switch(index){
        case 0:index=0;
        case 2:index=1;
        case 4:index=2;
      }
      return Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          iconsList[index],
          TextWidget(text: dataList[index], isBold: true, fontSize: 16),
          TextWidget(text: titleList[index], fontSize: 14),
        ],
      );
    }
    else{
    return SizedBox(height:MediaQuery.sizeOf(context).height*100/1000,
       child: VerticalDivider(),) ;
    }
  }
}
