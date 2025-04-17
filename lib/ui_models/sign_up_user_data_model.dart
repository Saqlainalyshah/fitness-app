import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/model_classes/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*extension ExtraFunction on Preferences{
  Preferences copyWith({
    int? age,
    int? height,
    int? weight,
    List<String>? unit,
    int? stepGoals,
    String? sensitivity,
    int? stepLength,
    String? firstDayOfWeek,
    bool? dailyStepReminder,
    Timestamp? reminderTime,
}){
    return Preferences(
    age: age??this.age,
      height: height??this.height,
      weight: weight??this.weight,
      unit: unit??this.unit,
      stepGoals: stepGoals??this.stepGoals,
      sensitivity: sensitivity??this.sensitivity,
      stepLength: stepLength??this.stepLength,
      firstDayOfWeek: firstDayOfWeek??this.firstDayOfWeek,
      dailyStepReminder: dailyStepReminder??this.dailyStepReminder,
      reminderTime: reminderTime??this.reminderTime,
    );
}

}*/
extension UserDataExtensions on PersonalInfo {
  // Adding the copyWith method
  PersonalInfo copyWith({
    String? uid,
    String? name,
    String? email,
    String? photoUrl,
    String? phoneNumber,
    String? gender,
    Timestamp? birthDate,
    bool? emailVerified,
    Preferences? preferences,

  }) {
    return PersonalInfo(
      uid: uid??this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl??this.photoUrl,
      phoneNumber: phoneNumber??this.phoneNumber,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      emailVerified: emailVerified??this.emailVerified,
      preferences: preferences??this.preferences,
    );
  }
}



class UserNotifier extends StateNotifier<PersonalInfo> {
  UserNotifier()
      : super(PersonalInfo());
  void setUserData(PersonalInfo personInfo) {
    state = personInfo;
  }

  void updateField({
    String? uid,
    String? name,
    String? email,
    String? photoUrl,
    String? phoneNumber,
    String? gender,
    Timestamp? birthDate,
    bool? emailVerified,
    Preferences? preferences,
  }) {
    state = state.copyWith(
      uid:uid,
      name: name,
      email: email,
      photoUrl:photoUrl,
      phoneNumber: phoneNumber,
      gender: gender,
      birthDate: birthDate,
      emailVerified: emailVerified,
      preferences: preferences,

    );
  }
}
final userTempDataProvider = StateNotifierProvider<UserNotifier, PersonalInfo>((ref) {
  return UserNotifier();
});
