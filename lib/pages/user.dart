import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_friend/functions/user_provider.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  TextEditingController _ageController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            String genderText = userProvider.selectedGender == 32
                ? 'мужской'
                : userProvider.selectedGender == 30
                    ? 'женский'
                    : 'неизвестный пол';

            String climateText = userProvider.climate == 1.0
                ? 'холодный'
                : userProvider.climate == 1.3
                    ? 'теплый'
                    : 'неизвестный';

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 20.0),
                Text('Пол: $genderText'),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Возраст: ${userProvider.age}'),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () => _showEditDialog(
                        context,
                        'Возраст',
                        userProvider.age.toString(),
                        (value) {
                          userProvider.setAge(int.parse(value));
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140, 34), // Установите размер кнопки
                      ),
                      child: Text('Редактировать'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Вес: ${userProvider.weight}'),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () => _showEditDialog(
                        context,
                        'Вес',
                        userProvider.weight.toString(),
                        (value) {
                          userProvider.setWeight(double.parse(value));
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140, 34), // Установите размер кнопки
                      ),
                      child: Text('Редактировать'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Климат: $climateText'),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () => _showClimateDropdown(
                        context,
                        userProvider.climate,
                        (value) {
                          userProvider.setClimate(value);
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140, 34), // Установите размер кнопки
                      ),
                      child: Text('Редактировать'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _showEditDialog(BuildContext context, String title,
      String initialValue, Function(String) onSave) async {
    TextEditingController controller =
        TextEditingController(text: initialValue);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Редактировать $title'),
          content: TextField(
            controller: controller,
            keyboardType: title == 'Возраст'
                ? TextInputType.number
                : TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: title),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(140, 34), // Установите размер кнопки
              ),
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showClimateDropdown(BuildContext context, double initialValue,
      Function(double) onSave) async {
    double selectedClimate = initialValue;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Редактировать Климат'),
          content: DropdownButton<double>(
            value: selectedClimate,
            items: [
              DropdownMenuItem(
                value: 1.0,
                child: Text('Холодный'),
              ),
              DropdownMenuItem(
                value: 1.3,
                child: Text('Теплый'),
              ),
              // Добавьте другие значения по необходимости
            ],
            onChanged: (value) {
              setState(() {
                selectedClimate = value!;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                onSave(selectedClimate);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(140, 34), // Установите размер кнопки
              ),
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }
}
