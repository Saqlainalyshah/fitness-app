import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/firebase/firebase_crud_operations/crud_operations.dart';
import 'package:fitness_app/model_classes/user.dart';
import 'package:fitness_app/screens/sign_up/user_form_screen.dart';
import 'package:fitness_app/ui_models/sign_up_user_data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../riverpord/global_providers.dart';
import '../../screens/landing_screen/landing_screen.dart';
import '../../screens/main_screen/main_screen.dart';
import '../../screens/welcome/welcome_screen.dart';
import '../../splash_screen/splash.dart';
import '../firebase_riverpord/firebase_riverpord.dart';
import 'package:flutter/material.dart';


class AuthChecker extends ConsumerWidget {
   AuthChecker({super.key});
final _date=StateProvider((ref)=>ref.watch(userTempDataProvider));
  readSharedPreferences(WidgetRef ref) async {
    ref.read(isLandedProvider.notifier).state =
        await ref.watch(localDatabaseProvider).getData("isLanded")??false;
    ref.read(isBiometricProvider.notifier).state=await ref.read(localDatabaseProvider).getData("isBiometric")??false;
  }
 /* getUserDocument(WidgetRef ref)async{
    DocumentSnapshot<Map<String, dynamic>>? documentSnapshot=await ref.watch(firebaseCRUDProvider).getDoc("users", ref.watch(currentUserProvider)!.uid);
    if(documentSnapshot!=null&&documentSnapshot.exists){
     Map<String,dynamic> doc=documentSnapshot.data()!;
     PersonalInfo person=PersonalInfo.fromJSON(doc);
     await ref.watch(localDatabaseProvider).setData(ref.watch(currentUserProvider)!.uid, person);
     ref.read(userTempDataProvider.notifier).setUserData(person);
    }
    *//*ref.watch(userTempDataProvider.notifier).setUserData(personInfo)*//*
  }
getData(WidgetRef ref)async{
  final result= await ref.watch(localDatabaseProvider).getData(ref.watch(currentUserProvider)!.uid);
  if(result==null){
    getUserDocument(ref);
  }else{
    return;
  }
}
*/


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    readSharedPreferences(ref);
    final authState = ref.watch(authStateProvider);
        return authState.when(
          data: (user) {
            if(user!=null){
              print(ref.watch(userTempDataProvider));
              return MainScreen();
            }else{
              if(ref.watch(isLandedProvider)){
                return WelcomeScreen();
              }else{
                return LandingScreen();
              }
            }
          },
          loading: () => SplashScreen(),
          error: (e, error) => WelcomeScreen(),
        );
  }
}
