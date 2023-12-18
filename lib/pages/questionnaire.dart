// gender_screen.dart
import 'package:flutter/material.dart';
import 'package:water_friend/pages/home_screen.dart';
import 'package:provider/provider.dart';
import '../functions/user_provider.dart';

class GenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выберите пол'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false)
                    .selectedGender = 32;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AgeScreen(),
                  ),
                );
              },
              child: Text('Мужской'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false)
                    .selectedGender = 30;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AgeScreen(),
                  ),
                );
              },
              child: Text('Женский'),
            ),
          ],
        ),
      ),
    );
  }
}

// age_screen.dart
class AgeScreen extends StatelessWidget {
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Введите возраст'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Возраст'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int age = int.tryParse(ageController.text) ?? 0;

                // Используйте провайдер для установки возраста
                Provider.of<UserProvider>(context, listen: false).setAge(age);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeightScreen(),
                  ),
                );
              },
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}

// weight_screen.dart

class WeightScreen extends StatelessWidget {
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Введите вес'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Вес'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Получите значение веса из контроллера
                double weight = double.tryParse(weightController.text) ?? 0.0;

                // Используйте провайдер для установки значения веса
                Provider.of<UserProvider>(context, listen: false)
                    .setWeight(weight);

                // Переход на следующий экран или выполнение другой логики
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClimateScreen(),
                  ),
                );
              },
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}

// climate_screen.dart

class ClimateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выберите климат'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Используйте провайдер для установки значения теплого климата
                Provider.of<UserProvider>(context, listen: false)
                    .setClimate(1.3);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text('Теплый'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Используйте провайдер для установки значения холодного климата
                Provider.of<UserProvider>(context, listen: false)
                    .setClimate(1.0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text('Холодный'),
            ),
          ],
        ),
      ),
    );
  }
}
