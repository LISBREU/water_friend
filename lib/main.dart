import 'package:flutter/material.dart';
import 'package:water_friend/pages/questionnaire.dart';
import 'package:provider/provider.dart';
import 'functions/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GenderScreen(),
    );
  }
}
