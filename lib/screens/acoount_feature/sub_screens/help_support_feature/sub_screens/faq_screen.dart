import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/app_fonts/custom_icons_icons.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:fitness_app/ui_widgets/text_widget.dart';
import 'package:fitness_app/ui_widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FAQScreen extends ConsumerWidget {
   FAQScreen({super.key});
final TextEditingController controller=TextEditingController();
   final selectedIndex=StateProvider.autoDispose<int>((ref)=>0);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    print("build FAQ");
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
        title: TextWidget(text: "FAQ",isBold: true,),
      ),
      body: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFieldWidget(controller: controller,
            onChanged: (value){
              ref.read(faqProvider.notifier).search(value);
            },
            leadingIcon: CustomIcons.search,
              hintText: "Search",
            ),
          ),
          SizedBox(
            height: 40,
            child: Consumer(
              builder: (context, ref, _) {
                print("build inside list");
                final selected = ref.watch(selectedIndex); // only watch once here
                List<String> l = ["General", "Account", "Services", "Steps"];

                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: l.length,
                  itemBuilder: (context, index) {
                    final isSelected = selected == index;

                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: isSelected ? BorderSide.none : null,
                        backgroundColor: isSelected ? AppColor.primaryColor : null,
                      ),
                      onPressed: () {
                        ref.read(selectedIndex.notifier).state = index;
                        ref.read(faqProvider.notifier).filterList(l[index]);
                      },
                      child: TextWidget(
                        text: l[index],
                        color: isSelected ? AppColor.secondaryColor : Colors.black,
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(width: 5),
                );
              },
            ),
          ),

          Expanded(
            child: Consumer(
              builder:(context,ref,child){
                print("build inside list");
                final faqList=ref.watch(faqProvider);

                return  ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: faqList.filteredItems.length,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  itemBuilder: (context,index){
                    final item= faqList.filteredItems[index];
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(text: item.title,isBold: true,),
                              IconButton(onPressed: () {
                                ref.read(faqProvider.notifier).toggleIsReadByFilteredIndex(index);

                              },
                              icon: Icon(item.isRead? Icons.keyboard_arrow_down_outlined: Icons.keyboard_arrow_up,color: Colors.grey.shade700,))

                            ],
                          ),
                          if(item.isRead==true)DividerWidget(),
                          if(item.isRead==true)TextWidget(text: item.subTitle,)
                        ],
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.all(10));
                },);
              },
            ),
          )
        ],
      ),
    );
  }
}
// Your fixed and improved code

// Model class
class FAQ {
  final String questionType;
  final String title;
  final String subTitle;
  final bool isRead;

  FAQ({
    required this.questionType,
    required this.title,
    required this.subTitle,
    required this.isRead,
  });

  FAQ copyWith({
    String? questionType,
    String? title,
    String? subTitle,
    bool? isRead,
  }) {
    return FAQ(
      questionType: questionType ?? this.questionType,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      isRead: isRead ?? this.isRead,
    );
  }
}

// Filter list class
class FilterList {
  final List<FAQ> allItems;
  final List<FAQ> filteredItems;
  final String search;

  FilterList({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  // Factory constructor for initial state with default filter
  factory FilterList.initial(List<FAQ> items) {
    final filtered = items.where((item) => item.questionType == "General").toList();
    return FilterList(
      allItems: items,
      filteredItems: filtered,
      search: "General",
    );
  }

  FilterList copyWith({
    List<FAQ>? allItems,
    List<FAQ>? filteredItems,
    String? search,
  }) {
    return FilterList(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}

// Notifier class
class FAQNotifier extends StateNotifier<FilterList> {
  FAQNotifier() : super(FilterList.initial(_initialItems));

  static final List<FAQ> _initialItems = [
    // General
    FAQ(
      questionType: "General",
      title: "What is this app about?",
      subTitle: "An overview of features and usage.",
      isRead: false,
    ),
    FAQ(
      questionType: "General",
      title: "How to contact support?",
      subTitle: "Ways to reach out to our team.",
      isRead: false,
    ),
    FAQ(
      questionType: "General",
      title: "Is my data secure?",
      subTitle: "Learn about our data protection policies.",
      isRead: false,
    ),
    FAQ(
      questionType: "General",
      title: "Does the app work offline?",
      subTitle: "Find out if you need an internet connection.",
      isRead: false,
    ),
    FAQ(
      questionType: "General",
      title: "Can I customize notifications?",
      subTitle: "Manage what alerts you receive.",
      isRead: false,
    ),
    // Account
    FAQ(
      questionType: "Account",
      title: "How do I reset my password?",
      subTitle: "Steps to recover your account access.",
      isRead: false,
    ),
    FAQ(
      questionType: "Account",
      title: "Can I change my email address?",
      subTitle: "Update your contact information easily.",
      isRead: false,
    ),
    FAQ(
      questionType: "Account",
      title: "How do I delete my account?",
      subTitle: "Permanently removing your profile.",
      isRead: false,
    ),
    FAQ(
      questionType: "Account",
      title: "Where can I update my profile info?",
      subTitle: "Edit your personal details anytime.",
      isRead: false,
    ),
    FAQ(
      questionType: "Account",
      title: "What if I forget my login info?",
      subTitle: "Recover your username or password.",
      isRead: false,
    ),
    // Services
    FAQ(
      questionType: "Services",
      title: "What services are offered?",
      subTitle: "A breakdown of available services.",
      isRead: false,
    ),
    FAQ(
      questionType: "Services",
      title: "How to book a service?",
      subTitle: "Guide to scheduling appointments.",
      isRead: false,
    ),
    FAQ(
      questionType: "Services",
      title: "Are there any service charges?",
      subTitle: "Learn about pricing and fees.",
      isRead: false,
    ),
    FAQ(
      questionType: "Services",
      title: "Can I cancel a booking?",
      subTitle: "Steps to cancel your appointment.",
      isRead: false,
    ),
    FAQ(
      questionType: "Services",
      title: "Do you offer customer support after services?",
      subTitle: "What help is available post-service?",
      isRead: false,
    ),
  ];

  void addItem(FAQ item) {
    final updatedList = [...state.allItems, item];
    state = state.copyWith(
      allItems: updatedList,
      filteredItems: _filterItems(updatedList, state.search),
    );
  }
  void search(String search){
    state=state.copyWith(filteredItems: searchTemp(state.allItems, search));
  }

 List<FAQ> searchTemp(List<FAQ> items,String search){
     if (search.isEmpty){
       return items;
     }
     return items.where((item)=>item.title.toLowerCase().contains(search.toLowerCase())).toList();
 }

  void toggleIsReadByFilteredIndex(int index) {
    final filteredItem = state.filteredItems[index];

    // Update the item in allItems by finding the matching one
    final updatedAll = state.allItems.map((faq) {
      if (faq.title == filteredItem.title && faq.questionType == filteredItem.questionType) {
        return faq.copyWith(isRead: !faq.isRead); // toggle isRead
      }
      return faq;
    }).toList();

    // Refresh filtered list with updated items
    final updatedFiltered = _filterItems(updatedAll, state.search);

    // Update the state
    state = state.copyWith(
      allItems: updatedAll,
      filteredItems: updatedFiltered,
    );
  }

  void filterList(String type) {
    state = state.copyWith(
      search: type,
      filteredItems: _filterItems(state.allItems, type),
    );
  }

  List<FAQ> _filterItems(List<FAQ> list, String type) {
    return list.where((item) => item.questionType == type).toList();
  }
}

// Riverpod provider
final faqProvider = StateNotifierProvider<FAQNotifier, FilterList>((ref) {
  return FAQNotifier();
});
