import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Импортируйте пакет
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
                double waterIntake = userProvider.waterIntake;
                double maxWaterIntake = userProvider.calculateWaterIntake();

                if (waterIntake >= maxWaterIntake) {
                  // Выводим уведомление "Норма дня выполнена"
                  Fluttertoast.showToast(
                    msg: "Норма дня выполнена!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }

                return Column(
                  children: [
                    Text('Количество воды: $maxWaterIntake мл'),
                    LinearProgressIndicator(
                      value: waterIntake / maxWaterIntake,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Используйте метод провайдера для добавления воды
                        userProvider.addWaterIntake(250.0);
                      },
                      child: Text('Добавить 250 мл'),
                    ),
                    Text('Количество выпитой воды: $waterIntake мл'),
                  ],
                );
              },
            ),

            // ... другие виджеты ...
          ],
        ),
      ),
    );
  }
}
