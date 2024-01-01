import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static Future initilaze(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitilize =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    DarwinInitializationSettings initializationSettingsDarwin =
        const DarwinInitializationSettings();

    var initilizationSettings = InitializationSettings(
        android: androidInitilize, iOS: initializationSettingsDarwin);
    await flutterLocalNotificationsPlugin.initialize(initilizationSettings);
  }

  static void startAutomaticNotifications({
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) {
    const Duration duration = Duration(seconds: 30);

    Timer.periodic(duration, (Timer timer) {
      // Вызов функции отправки уведомления
      showBigTextNotification(
        title: "Water Friend",
        body: "Пора выпить воды!",
        flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
      );
    });
  }

  static Future showBigTextNotification({
    required String title,
    required String body,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'water_friend_notifications_12345',
      'channel_name',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentSound: false,
    );

    var not = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(0, title, body, not);
  }
}
