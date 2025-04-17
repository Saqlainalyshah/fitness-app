import 'package:fitness_app/ui_widgets/span_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_color/color.dart';
import '../../../ui_models/sign_up_user_data_model.dart';
import '../../../ui_widgets/text_widget.dart';
final gender=StateProvider<String>((ref)=>"");
class GenderWidget extends StatelessWidget {
   GenderWidget({super.key});
  final _index=StateProvider.autoDispose<int>((ref)=>0);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpanTextWidget(simpleText:"Select Your", spanText: " Gender",),
        TextWidget(text: "Let's start by understanding you",fontSize: 19,),
        Consumer(
          builder:(context,ref,child)=> Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: List.generate((2), (index){
              List<String> list=['assets/images/gender/man.png','assets/images/gender/women.png'];
              List<String> l=['man','women'];
              return Column(
                children: [
                  GestureDetector(
                    onTap:(){
                        ref.read(_index.notifier).state=index;
                        ref.read(gender.notifier).state=index==0?"Male":"Female";
                        },
                    child: SizedBox(
                        height: ref.watch(_index)==index? MediaQuery.sizeOf(context).height*0.55:MediaQuery.sizeOf(context).height* 0.3,
                        width: ref.watch(_index)==index? MediaQuery.sizeOf(context).width*0.5:MediaQuery.sizeOf(context).width*0.35 ,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            if(ref.watch(_index)==index) ...[
                              Positioned(
                                top: 30,
                                left: 0,
                                right: ref.watch(_index)==1?150:90,
                                child:  Container(
                                  //width: 10,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 50,
                                left: ref.watch(_index)==1?30:120,
                                right: 0,
                                child:  Container(
                                  //width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                  //AppColor.primaryColor,

                                ),
                              ),
                              Positioned(
                                top: 150,
                                left: ref.watch(_index)==1?110:160,
                                right: 0,
                                child:  Container(
                                  //width: 10,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                  //AppColor.primaryColor,

                                ),
                              ),
                              Positioned(
                                top: ref.watch(_index)==1?170:180,
                                left:ref.watch(_index)==1?90: 140,
                                right: 0,
                                child:  Container(
                                  height: 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 150,
                                left: 0,
                                right: ref.watch(_index)==1?190:140,
                                child:  Container(
                                  //width: 10,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                  //AppColor.primaryColor,

                                ),
                              ),
                              Positioned(
                                top: 70,
                                left: 10,
                                right: ref.watch(_index)==1?50:0,
                                child:  Container(
                                  //width: 10,
                                  height: 140,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primaryColor
                                  ),
                                  //AppColor.primaryColor,

                                ),
                              ),
                            ],
                            ClipOval(
                              child:Container(
                                width:ref.watch(_index)==index?200:70,
                                  height: ref.watch(_index)==index? 60:20,
                                  color: ref.watch(_index)==index?AppColor.primaryColor:Colors.grey.shade300 //AppColor.primaryColor,
                              ),
                            ),
                            Positioned(
                                top: 10,
                                bottom: ref.watch(_index)==index?20:5,
                                child: Image.asset(list[index],)),

                          ],
                        )
                    ),
                  ),
                  if( ref.watch(_index)==index)TextWidget(text: l[index],fontSize: 20,isBold: true,)
                ],
              );
            }),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}