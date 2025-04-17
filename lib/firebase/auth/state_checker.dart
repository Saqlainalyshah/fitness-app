import 'package:fitness_app/animations/transition.dart';
import 'package:fitness_app/screens/main_screen/main_screen.dart';
import 'package:fitness_app/ui_widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_riverpord/firebase_riverpord.dart';
import 'login_states.dart';

class StateChecker{
  static checkFirebaseAuthState(BuildContext context,WidgetRef ref){
    ref.listen<LoginState>(loginControllerProvider, ((previous,state){
      if(state is LoginStateError){
        UiEventHandler.snackBarWidget(context, "Oops! Something went wrong",false);
      }else if(state is LoginStateSuccess){
        //UiEventHandler.snackBarWidget(context, "Action done successfully",true);
        TransitionAnimation.navigator(context, MainScreen());
      }
    }));
  }
}