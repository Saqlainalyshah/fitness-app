import 'package:fitness_app/local_auth/local_authstate_check.dart';
import 'package:fitness_app/riverpord/global_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import '../firebase/firebase_riverpord/firebase_riverpord.dart';
import 'local_states.dart';



class LocalAuthController extends StateNotifier{
  LocalAuthController(this.ref) : super(null);
  final Ref ref;
  authenticateWithBiometrics(BuildContext context,) async {
    final LocalAuthentication auth = LocalAuthentication();
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
      if(authenticated==true){
        await ref.watch(localDatabaseProvider).setData("isBiometric", true);
        ref.read(isBiometricProvider.notifier).state=true;

      }else if(authenticated==false){
        await ref.watch(localDatabaseProvider).setData('isBiometric', false);
        ref.read(isBiometricProvider.notifier).state=false;
      }


    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      await ref.watch(localDatabaseProvider).setData('isBiometric', false);
      ref.read(isBiometricProvider.notifier).state=false;

    }

  }


}

final localAuthControllerProvider= Provider<LocalAuthController>((ref)=>LocalAuthController(ref));