import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../functions/notifications.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    LocalNotification.initilaze(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          width: 180,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              LocalNotification.showBigTextNotification(
                  title: 'Water_Friend',
                  body: 'Пора выпить воды !',
                  flutterLocalNotificationsPlugin:
                      flutterLocalNotificationsPlugin);
            },
            child: const Text(
              "send",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
