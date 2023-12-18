import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  int _selectedGender = 0; // 0 по умолчанию
  int _age = 0;
  double _weight = 0.0;
  double _climate = 1.0;

  int get selectedGender => _selectedGender;
  int get age => _age;
  double get weight => _weight;
  double get climate => _climate;

  set selectedGender(int value) {
    _selectedGender = value;
    notifyListeners();
  }

  setAge(int value) {
    _age = value;
    notifyListeners();
  }

  setWeight(double value) {
    _weight = value;
    notifyListeners();
  }

  setClimate(double value) {
    _climate = value;
    notifyListeners();
  }

  double calculateWaterIntake() {
    double baseWaterIntake = weight * climate * selectedGender;
    return baseWaterIntake;
  }
}
