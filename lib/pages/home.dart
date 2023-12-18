import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../functions/user_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ... другие виджеты ...

            // Используйте Consumer для получения и использования данных
            Consumer<UserProvider>(
              builder: (context, userProvider, _) {
                double waterIntake = userProvider.calculateWaterIntake();
                return Text('Количество воды: $waterIntake мл');
              },
            ),

            // ... другие виджеты ...
          ],
        ),
      ),
    );
  }
}
