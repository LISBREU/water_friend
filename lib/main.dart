import 'package:flutter/material.dart';
import 'package:water_friend/pages/questionnaire.dart'; // Подключите ваш GenderScreen
import 'package:water_friend/pages/home_screen.dart'; // Подключите ваш home_screen
import 'package:provider/provider.dart';
import 'functions/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserProvider userProvider = UserProvider();
  await userProvider.loadData();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: userProvider),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        // Используем FutureBuilder для проверки состояния приложения
        future: checkFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Если выполнение завершено, проверяем результат
            if (snapshot.data == true) {
              // Если это первый раз, покажем GenderScreen
              return GenderScreen();
            } else {
              // В противном случае, покажем home_screen
              return HomeScreen();
            }
          } else {
            // Пока идет проверка, можно показать какой-то индикатор загрузки
            return HomeScreen();
          }
        },
      ),
    );
  }

  Future<bool> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time') ?? true;

    if (firstTime) {
      // Если это первый раз, установим значение в false и вернем true
      prefs.setBool('first_time', false);
      return true;
    } else {
      // Если это не первый раз, вернем false
      return false;
    }
  }
}
