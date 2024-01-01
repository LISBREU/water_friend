import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  int _selectedGender = 0;
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
    saveData(); // Сохраняем данные при каждом изменении
  }

  void addWaterIntake(double value) {
    _waterIntake += value;
    notifyListeners();
    saveData(); // Сохраняем данные при каждом изменении
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedGender', _selectedGender);
    prefs.setInt('age', _age);
    prefs.setDouble('weight', _weight);
    prefs.setDouble('climate', _climate);
    prefs.setDouble('waterIntake', _waterIntake);
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedGender = prefs.getInt('selectedGender') ?? 0;
    _age = prefs.getInt('age') ?? 0;
    _weight = prefs.getDouble('weight') ?? 0.0;
    _climate = prefs.getDouble('climate') ?? 1.0;
    _waterIntake = prefs.getDouble('waterIntake') ?? 0.0;
    notifyListeners();
  }
}
