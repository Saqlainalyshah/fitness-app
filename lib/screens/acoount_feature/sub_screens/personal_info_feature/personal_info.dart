import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/ui_models/sign_up_user_data_model.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:fitness_app/ui_widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../ui_widgets/phone_textfield.dart';

class PersonalInfo extends ConsumerWidget {
   PersonalInfo({super.key});
final TextEditingController controller=TextEditingController();
   final f =  DateFormat('dd/MM/yyyy');


   final _dateOfBirthProvider=StateProvider.autoDispose<DateTime>((ref)=>DateTime.now());
   Future<void> _selectDate(BuildContext context,WidgetRef ref) async {
     DateTime? pickedDate = await showDatePicker(
       context: context,
       initialDate: ref.watch(_dateOfBirthProvider),
       firstDate: DateTime(2000),
       lastDate: DateTime(2100),
     );

     if (pickedDate != null) {
       ref.read(_dateOfBirthProvider.notifier).state=pickedDate;
       
     }
   }
   final TextEditingController _nameCon=TextEditingController();
   final TextEditingController _emailCon=TextEditingController();
   final TextEditingController _phoneCon=TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   /* final data=ref.watch(userTempDataProvider);
    _nameCon.text=data.name!;
    _emailCon.text=data.email!;
    _phoneCon.text=data.phoneNumber!;*/
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,

        title: Text("Personal Info"),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                       /* image: DecorationImage(image: NetworkImage(data.url.toString()),
                        fit: BoxFit.cover
                        ),*/
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color:AppColor.primaryColor,
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.white,))),
                    )
                  ],
                ),
              ),
              TextWidget(text: "Full Name",isBold: true,fontSize: 15,),
              TextFieldWidget(controller: _nameCon,fillColor: Colors.grey.shade200,),
              TextWidget(text: "Email",isBold: true,fontSize: 15,),
              TextFieldWidget(
                controller: _emailCon,
                fillColor: Colors.grey.shade200,
                leadingIcon: CustomIcons.message,
              ),
              TextWidget(text: "Phone Number",isBold: true,fontSize: 15,),
              PhoneTextField(controller: _phoneCon,fillColor: Colors.grey.shade200, onChanged: (value ) {  },),
              TextWidget(text: "Gender ",isBold: true,fontSize: 15,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  Colors.grey.shade200
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: AppColor.secondaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    value: "Male",
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54), // Dropdown arrow
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    onChanged: (value){
        
                    },
                    items: ["Male","Female"].map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: TextWidget(text: item, fontSize: 16,isBold: true,),
                      );
                    }).toList(),
                  ),
                ),
                ),
              TextWidget(text: "Birth Date",isBold: true,fontSize: 15,),
              GestureDetector(
                onTap: (){
                  _selectDate(context, ref);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  Colors.grey.shade200
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: f.format(ref.watch(_dateOfBirthProvider)),isBold: true,),
                      Icon(CustomIcons.calendar),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
