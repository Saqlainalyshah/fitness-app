class PreferencesDataClass {
  static List<String> genderList = ["Male", "Female"];
  static List<String> ageList = List.generate(100, (index) => "$index years");
  static List<String> heightList = List.generate(300, (index) =>
  "$index cm");
  static List<String> weightList = List.generate(150, (index) => "$index kg");
  static List<String> unitList = ["kg", "cm", "km"];
  static List<String> sensitivityList = ["Small", "Medium", "Large"];
  static List<String> stepLength = List.generate(100, (index) => "$index cm");
  static List<String> weekList = [
    "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
  ];
  static bool stepRemainder = false;
  static List<String> remainderTimeList = List.generate(24, (index) {
    return "${index+1}:00";
  });

  static List<String> titlesList = [
    "Gender", "Age", "Height", "Weight", "Unit",
    "Step Goal", "Sensitivity", "Step Length",
    "First Day of Week", "Daily Step Reminder", "Reminder Time"
  ];


}
