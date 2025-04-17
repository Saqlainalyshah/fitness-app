import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/firebase/auth/firebase_auth_exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../firebase_riverpord/firebase_riverpord.dart';
import 'login_states.dart';

class LoginController extends StateNotifier<LoginState>{
  LoginController(this.ref):super(const LoginStateLoading());
  final Ref ref;
  getUser()async{
    FirebaseAuth.instance.currentUser!.email;
  }
  Future<AuthResultStatus> createUserWithEmailAndPassword(String email, String password)async{
     AuthResultStatus status;

    try{
     UserCredential credential= await ref.watch(authRepositoryProvider).createUserWithEmailAndPassword(email, password);
      state=const LoginStateSuccess();
     if(credential.user!=null){
       status=AuthResultStatus.successful;
     }else{
       status=AuthResultStatus.undefined;
     }
    }on FirebaseAuthException catch(e){
      state=LoginStateError(e.toString());
      status = AuthExceptionHandler.handleException(e);
    }
    return status;
  }

  Future<AuthResultStatus> loginWithEmailAndPassword(String email, String password)async{
    state=const LoginStateLoading();
    AuthResultStatus status;
    try{
       UserCredential credential= await ref.watch(authRepositoryProvider).signInWithEmailAndPassword(email, password);
      state=const LoginStateSuccess();
      if(credential.user!=null){
        status=AuthResultStatus.successful;
      }else{
        status=AuthResultStatus.undefined;
      }
    }on FirebaseAuthException catch(e){
      state=LoginStateError(e.toString());
       status = AuthExceptionHandler.handleException(e);
    }

    return status;
  }

   logOut() async{
    state=const LoginStateSuccess();

    try{
      await ref.watch(authRepositoryProvider).signOut();
      state=const LoginStateLoading();
    }catch(e){
      state=LoginStateError(e.toString());
    }
  }
  Future<bool> continueWithGoogle() async {
    state = const LoginStateLoading();
    try {
      final userCredential = await ref.read(authRepositoryProvider).signInWithGoogle();
      if (userCredential != null) {
        state = const LoginStateSuccess();
        return true;
      } else {
        state = const LoginStateError("Google sign-in failed.");
        return false;
      }
    } catch (e) {
      state = LoginStateError(e.toString());
      return false;
    }
  }


/*
   void continueWithFacebook()async{
     state=const LoginStateLoading();
     try{
      ref.read(authRepositoryProvider).signInWithFacebook();
      state=const LoginStateSuccess();
     }catch (e){
      state=LoginStateError(e.toString());
    }

   }
  void continueWithTwitter()async{
    state=const LoginStateLoading();
    try {
      ref.read(authRepositoryProvider).signInWithTwitter();
      state=const LoginStateSuccess();
    }catch (e){
      state=LoginStateError(e.toString());
    }
  }
  void continueWithApple()async{
    state=const LoginStateLoading();
    try {
      ref.read(authRepositoryProvider).signInWithApple();
      state=const LoginStateSuccess();
    }catch (e){
      state=LoginStateError(e.toString());
    }
  }
*/

   verifyPhoneNumber(BuildContext context, String phoneNumber) async{
    try{
      await ref.watch(authRepositoryProvider).sendOtpOnNumber(context, phoneNumber);
    } catch (e){
      state=LoginStateError(e.toString());
    }
  }
}

