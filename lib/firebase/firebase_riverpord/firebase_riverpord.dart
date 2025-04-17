import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_repository.dart';
import '../auth/login_controller.dart';
import '../auth/login_states.dart';

final loginControllerProvider= StateNotifierProvider<LoginController,LoginState>((ref)=>LoginController(ref));
final authRepositoryProvider=Provider<AuthRepository>((ref)=> AuthRepository(FirebaseAuth.instance));

final authStateProvider = StreamProvider<User?>((ref) async* {
  // Delay the stream for 2 seconds
  await Future.delayed(Duration(seconds: 2));

  // Emit the authentication state after the delay
  yield* ref.read(authRepositoryProvider).authStateChange;
});

final currentUserProvider=StateProvider<User?>((ref)=>FirebaseAuth.instance.currentUser);

final isBiometricProvider=StateProvider<bool>((ref)=>false);


