import 'package:fitness_app/app_color/color.dart';
import 'package:fitness_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app_fonts/custom_icons_icons.dart';
import '../acoount_feature/account_screen.dart';
import '../history_feature/history_screen.dart';
import '../home/home_screen.dart';
import '../report_feature/report_screen.dart';
import '../track_feature/track_screen.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final List<Widget> screenList = [
    HomeScreen(),
    TrackScreen(),
    ReportScreen(),
    HistoryScreen(),
    AccountScreen()];
  final List<String> list = ['Home', 'Track', 'Report', 'History', 'Account'];
  final _index=StateProvider.autoDispose<int>((red)=>0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
      
          leading: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>WelcomeScreen()));
            },
            child: Icon(
              CustomIcons.app,
              color: AppColor.primaryColor,
            ),
          ),
          backgroundColor: Colors.grey.shade200,
          title: Text(list[ref.watch(_index)]),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
            }, icon: Icon(Icons.more_vert_outlined))
          ],
        ),
        body: screenList[ref.watch(_index)],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: Colors.black38,
            elevation: 0.0,
            selectedIconTheme: const IconThemeData(size: 30),
            showUnselectedLabels: true,
            currentIndex: ref.watch(_index),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            onTap: (index) {
              ref.read(_index.notifier).state = index;
            },
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(CustomIcons.home),
              ),
              BottomNavigationBarItem(
                label: "Track",
                icon: Icon(CustomIcons.location),
              ),
              BottomNavigationBarItem(
                label: "Report",
                icon:
                    Icon(CustomIcons.activity), // don't know the name of the icon
              ),
              BottomNavigationBarItem(
                label: "History",
                icon: Icon(CustomIcons.paper), // don't know the name of the icon
              ),
              BottomNavigationBarItem(
                label: "Account",
                icon: Icon(CustomIcons.profile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
