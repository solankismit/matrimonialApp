import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool validateEmptyField(List<TextEditingController> textEditingController,BuildContext context) {
  bool flag = true;
  for (int i = 0; i < textEditingController.length; i++) {
    if (textEditingController[i].text.isEmpty) {
      flag = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
      break;
    }
  }
  return flag;
}
bool validateDropdown(List<String> dropdownMenuItem,BuildContext context) {
  bool flag = true;
  for (int i = 0; i < dropdownMenuItem.length; i++) {
    if (dropdownMenuItem[i] == "null") {
      flag = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
      break;
    }
  }
  return flag;
}
bool validateEmail(String email) {
  RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(email);
}

bool validateAge(int age,context) {
  if (age < 18) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You must be 18 years old to register")));
    return false;
  } else {
    return true;
  }
}

bool validateWeight(int weight,context) {
  if (weight < 30 || weight > 140) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a valid weight.")));
    return false;
  } else {
    return true;
  }
}

bool validateBio(String bio,context) {
  if (bio.length < 100) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bio should be greater than 100 characters.")));
    return false;
  } else {
    return true;
  }
}