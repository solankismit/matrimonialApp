import 'package:flutter/material.dart';
class DataModelProvider with ChangeNotifier {
  // DataModel data;
  String firstName = "";
  String lastName = "";
  String name ="";
  String occupation = "";
  String companyName = "";
  String height = "";
  String status = "";
  String religion = "";
  String settleDown = "";
  String foodPreference = "";
  String homeTown = "";

  setName(String name) {
    this.name = name;
    notifyListeners();
  }

  setOccupation(String occupation) {
    this.occupation = occupation;
    notifyListeners();
  }

}