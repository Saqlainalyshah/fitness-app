import 'package:fitness_app/ui_models/landing_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'landing_screen.dart';

class LandingPages extends ConsumerWidget {
  const LandingPages({super.key,

  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final pageController=ref.watch(landingPageControllerProvider);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height*0.85,
      child: PageView.builder(
          itemCount: LandingPageModel.landingPageModelList.length,
          controller: pageController,
          onPageChanged: (index){
            ref.watch(landingPageIndex.notifier).state=index;
          },
          itemBuilder: (context,index){
            return  Image.asset(
              LandingPageModel.landingPageModelList[index].imageUrl,
              width: double.infinity,
            );
          }),
    );
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

// Custom Clipper
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.5, 90, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
