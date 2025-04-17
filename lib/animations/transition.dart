import 'package:flutter/cupertino.dart';

class TransitionAnimation{
  static  transition(BuildContext context, Widget widget, dynamic type){
    return Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {

          if(type is FadeTransition){
            return Align(
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          }else if(type is ScaleTransition){
            return Align(
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          }else if(type is SizeTransition){
            return Align(
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          }
          else if(type is RotationTransition){
            return Align(
              child: RotationTransition(
                turns: animation,
                child: child,
              ),
            );
          }

          else {
            return Align(
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          }

        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static navigator(BuildContext context, Widget widget){
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => widget,
        transitionDuration: Duration(milliseconds: 200),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      ),
    );
  }
}

