// home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Домашний экран'),
      ),
      body: Center(
        child: Text('Добро пожаловать на домашний экран!'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 34,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 34,
            ),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 34,
            ),
            label: 'Настройки',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              size: 34,
            ),
            label: 'Информация',
          ),
        ],
        selectedItemColor: Colors.blue, // Цвет выбранного элемента
        unselectedItemColor:
            Color.fromARGB(255, 112, 148, 198), // Цвет не выбранных элементов
      ),
    );
  }
}
