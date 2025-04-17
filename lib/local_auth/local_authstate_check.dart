/*
import 'package:fitness_app/firebase/auth/auth_checker.dart';
import 'package:fitness_app/local_auth/local_auth.dart';
import 'package:fitness_app/local_auth/local_states.dart';
import 'package:fitness_app/splash_screen/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../animations/transition.dart';
import '../ui_widgets/snackbar.dart';

class LocalAuthStateChecker{
  static checkLocalAuthState(BuildContext context,WidgetRef ref){
    ref.listen<LocalAuthStates>(localAuthControllerProvider, ((previous,state){
      if(state is Authorized){

        UiEventHandler.snackBarWidget(context, "Authorization successful",true);
        TransitionAnimation.navigator(context, AuthChecker());
      }else if(state is Unauthorized){
        UiEventHandler.snackBarWidget(context, "Oops! Something went wrong",false);

      }
    }));
  }
}*/
