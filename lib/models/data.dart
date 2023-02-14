class DataModel {
  final String firstName;
  final String lastName;
  final String occupation;
  final String companyName;
  final String height;
  final String status;
  final String religion;
  final String settleDown;
  final String foodPreference;
  final String homeTown;

  DataModel(
      {required this.occupation,
      required this.companyName,
      required this.height,
      required this.status,
      required this.religion,
      required this.settleDown,
      required this.foodPreference,
      required this.homeTown,
      required this.firstName,
      required this.lastName});
}
