import 'package:fitness_app/firebase/auth/auth_checker.dart';
import 'package:fitness_app/riverpord/global_providers.dart';
import 'package:fitness_app/screens/landing_screen/landing_pages.dart';
import 'package:fitness_app/screens/welcome/welcome_screen.dart';
import 'package:fitness_app/ui_widgets/basic_widgets.dart';
import 'package:fitness_app/ui_widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../app_color/color.dart';
import '../../ui_models/landing_page_model.dart';
import '../../ui_widgets/text_widget.dart';

final landingPageIndex=StateProvider<int>((ref)=>0);
final landingPageControllerProvider = StateProvider.autoDispose<PageController>((ref)=>PageController());

class LandingScreen extends ConsumerWidget {
   const LandingScreen({super.key});


Future<void> _set(WidgetRef ref)async{
  await ref.watch(localDatabaseProvider).setData("isLanded", true);
  ref.read(isLandedProvider.notifier).state=true;
}
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final pageController=ref.watch(landingPageControllerProvider);
    return SafeArea(

      child: Scaffold(
        backgroundColor:  AppColor.primaryColor,
        body:  Container(
          height: MediaQuery.sizeOf(context).height,
          color:  AppColor.primaryColor,
          child: Stack(
              //alignment: Alignment.center,
            children:[
              LandingPages(),
              Positioned(
                bottom: 0,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, MediaQuery.sizeOf(context).height*0.4,),
                  painter: ShadowPainter(),
                ),
              ),
              Positioned(
                bottom: 0,
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    // margin: sEdgeInsets.all(20),
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height*0.4,
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [
                        //SizedBox(height: 20,),
                        TextWidget(
                          text: LandingPageModel.landingPageModelList[ref.watch(landingPageIndex)].title,
                          fontSize: 32,
                          isBold: true,
                          textAlign: TextAlign.center,
                        ),
                        TextWidget(
                          text: LandingPageModel.landingPageModelList[ref.watch(landingPageIndex)].description,
                          textAlign: TextAlign.center,
                          fontSize: 17,
                        ),
                        SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: ExpandingDotsEffect(
                            activeDotColor: AppColor.primaryColor,
                            dotColor: Colors.grey.shade300,
                            dotHeight: 8.0,
                            dotWidth: 10.0,
                            spacing: 10.0,
                          ),
                        ),
                        DividerWidget(height: 20),
                        Row(
                          mainAxisAlignment: ref.watch(landingPageIndex) != 2
                              ? MainAxisAlignment.spaceEvenly
                              : MainAxisAlignment.center,
                          children: [
                            if (ref.watch(landingPageIndex) != 2)
                              ButtonWidget(
                                onPress: () {
                                  _set(ref).whenComplete(() {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => WelcomeScreen(value: true,)),
                                          (route) => false,
                                    );
                                  });
                                },
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                color: AppColor.optionalColor,
                                title: "Skip",
                                titleColor: AppColor.primaryColor,
                              ),
                            ButtonWidget(
                              onPress: () {
                                if (ref.watch(landingPageIndex) == 2) {
                                  _set(ref).whenComplete(() {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => WelcomeScreen(value: true,)),
                                          (route) => false,
                                    );
                                  });

                                } else {
                                  int index = ref.watch(landingPageIndex);
                                  ref.read(landingPageIndex.notifier).state = index + 1;
                                  pageController.animateToPage(
                                    ref.watch(landingPageIndex),
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.bounceInOut,
                                  );
                                }
                              },
                              width: ref.watch(landingPageIndex) == 2
                                  ? MediaQuery.sizeOf(context).width * 0.9
                                  : MediaQuery.sizeOf(context).width * 0.4,
                              color: AppColor.primaryColor,
                              title: "Continue",
                              titleColor: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

            ]
          ),
        ),
      )
    );
  }
}


class MyColumnClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint shadowPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3) // Shadow color
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 5.0); // Blur effect

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.5, 90, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}