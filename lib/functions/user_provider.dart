import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  int _selectedGender = 0; // 0 по умолчанию
  int _age = 0;
  double _weight = 0.0;
  double _climate = 1.0;
  double _waterIntake = 0.0;

  int get selectedGender => _selectedGender;
  int get age => _age;
  double get weight => _weight;
  double get climate => _climate;
  double get waterIntake => _waterIntake;

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

  setWaterIntake(double value) {
    _waterIntake = value;
    notifyListeners();
  }

  void addWaterIntake(double value) {
    _waterIntake += value;
    notifyListeners();
  }
}
