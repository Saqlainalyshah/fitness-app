import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalInfo {
  String? uid;
  String? name;
  String? email;
  String? photoUrl;
  String? phoneNumber;
  String? gender;
  Timestamp? birthDate;
  bool? emailVerified;
  Preferences? preferences;
  PersonalInfo({this.uid,this.name, this.email, this.photoUrl,this.phoneNumber, this.gender, this.birthDate,this.emailVerified, this.preferences});

  factory PersonalInfo.fromJSON(Map<String, dynamic> json) {
    return PersonalInfo(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      birthDate: json['birthDate'],
      emailVerified: json['emailVerified'],
      preferences: json['preferences'] != null ? Preferences.fromJSON(json['preferences']) : null,
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid':uid,
      'name': name,
      'email': email,
      'photoUrl':photoUrl,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'birthDate': birthDate,
      'emailVerified':emailVerified,
      'preferences': preferences?.toJSON(),
    };
  }
}

class Preferences {
  int? age;
  int? height;
  int? weight;
  List<String>? unit;
  bool? sedentaryLife;
  int? stepGoals;
  String? sensitivity;
  int? stepLength;
  String? firstDayOfWeek;
  bool? dailyStepReminder;
  Timestamp? reminderTime;

  Preferences({
    this.age,
    this.height,
    this.weight,
    this.unit,
    this.sedentaryLife,
    this.stepGoals,
    this.sensitivity,
    this.stepLength,
    this.firstDayOfWeek,
    this.dailyStepReminder,
    this.reminderTime,
  });

  factory Preferences.fromJSON(Map<String, dynamic> json) {
    return Preferences(
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      sedentaryLife: json['sedentaryLife'],
      unit: json['unit'] != null ? List<String>.from(json['unit']) : null,
      stepGoals: json['stepGoals'],
      sensitivity: json['sensitivity'],
      stepLength: json['stepLength'],
      firstDayOfWeek: json['firstDayOfWeek'],
      dailyStepReminder: json['dailyStepReminder'],
      reminderTime: json['reminderTime'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'age': age,
      'height': height,
      'weight': weight,
      'sedentaryLife':sedentaryLife,
      'unit': unit,
      'stepGoals': stepGoals,
      'sensitivity': sensitivity,
      'stepLength': stepLength,
      'firstDayOfWeek': firstDayOfWeek,
      'dailyStepReminder': dailyStepReminder,
      'reminderTime': reminderTime,
    };
  }
}
