import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/firebase/auth/auth_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthChecker(),
    ),
  ));
}

