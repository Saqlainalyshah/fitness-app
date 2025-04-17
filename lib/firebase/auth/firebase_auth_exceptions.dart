import 'package:firebase_auth/firebase_auth.dart';

enum AuthResultStatus {
  successful,
  invalidCredential,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
}

class AuthExceptionHandler {

  static AuthResultStatus handleException(FirebaseAuthException e) {
    AuthResultStatus status;
    print("Firebase Auth Error Code: ${e.code}");
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "user-disabled":
        status = AuthResultStatus.userDisabled;
        break;
      case "too-many-requests":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "invalid-credential":
        status=AuthResultStatus.invalidCredential;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  static String generateExceptionMessage(AuthResultStatus exceptionCode) {

    switch (exceptionCode) {
      case AuthResultStatus.successful:
        return "Successfully logged in";
      case AuthResultStatus.invalidCredential:
        return "Please enter correct email and paswword";
      case AuthResultStatus.emailAlreadyExists:
        return "The email has already been registered. Please log in or reset your password.";
      case AuthResultStatus.wrongPassword:
        return "Your password is incorrect.";
      case AuthResultStatus.invalidEmail:
        return "Your email address appears to be malformed.";
      case AuthResultStatus.userNotFound:
        return "User with this email doesn't exist.";
      case AuthResultStatus.userDisabled:
        return "User with this email has been disabled.";
      case AuthResultStatus.operationNotAllowed:
        return "Signing in with Email and Password is not enabled.";
      case AuthResultStatus.tooManyRequests:
        return "Too many requests. Try again later.";
      default:
        return "An undefined error occurred.";
    }
  }
}
