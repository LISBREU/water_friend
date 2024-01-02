import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  int _selectedGender = 1;
  int _age = 1;
  double _weight = 1.0;
  double _climate = 1.0;
  double _waterIntake = 0.0;
  DateTime? _lastUpdateDate;

  UserProvider() : _lastUpdateDate = DateTime.now() {
    loadData();
  }

  int get selectedGender => _selectedGender;
  int get age => _age;
  double get weight => _weight;
  double get climate => _climate;
  double get waterIntake => _waterIntake;

  set selectedGender(int value) {
    _selectedGender = value;
    notifyListeners();
    _saveData();
  }

  setAge(int value) {
    _age = value;
    notifyListeners();
    _saveData();
  }

  setWeight(double value) {
    _weight = value;
    notifyListeners();
    _saveData();
  }

  setClimate(double value) {
    _climate = value;
    notifyListeners();
    _saveData();
  }

  double calculateWaterIntake() {
    double baseWaterIntake = weight * climate * selectedGender;
    return baseWaterIntake;
  }

  setWaterIntake(double value) {
    _waterIntake = value;
    notifyListeners();
    _saveData(); // Сохраняем данные при каждом изменении
  }

  void addWaterIntake(double value) {
    _waterIntake += value;
    notifyListeners();
    _saveData(); // Сохраняем данные при каждом изменении
  }

  void resetWaterIntake() {
    _waterIntake = 0.0;
    _lastUpdateDate = DateTime.now();
    notifyListeners();
    _saveData(); // Сохраняем данные при каждом изменении
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedGender = prefs.getInt('selectedGender') ?? 1;
    _age = prefs.getInt('age') ?? 1;
    _weight = prefs.getDouble('weight') ?? 1.0;
    _climate = prefs.getDouble('climate') ?? 1.0;
    _waterIntake = prefs.getDouble('waterIntake') ?? 0.0;
    int lastUpdateDateInMillis = prefs.getInt('lastUpdateDate') ?? 0;
    _lastUpdateDate = lastUpdateDateInMillis != 0
        ? DateTime.fromMillisecondsSinceEpoch(lastUpdateDateInMillis)
        : null;

    // Проверяем, если сегодня первый вход в приложение, то сбрасываем waterIntake
    if (_lastUpdateDate == null ||
        !_isSameDay(DateTime.now(), _lastUpdateDate!)) {
      resetWaterIntake();
    }
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedGender', _selectedGender);
    prefs.setInt('age', _age);
    prefs.setDouble('weight', _weight);
    prefs.setDouble('climate', _climate);
    prefs.setDouble('waterIntake', _waterIntake);
    prefs.setInt(
        'lastUpdateDate', _lastUpdateDate?.millisecondsSinceEpoch ?? 0);
  }

  // Проверяет, являются ли две даты одним и тем же днем
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
