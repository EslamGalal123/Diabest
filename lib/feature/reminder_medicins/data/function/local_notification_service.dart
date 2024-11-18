import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;


class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse notificationResponse) {}
  static Future init() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse: onTap,
        onDidReceiveBackgroundNotificationResponse: onTap);
  }

  static void showBasicNotification() {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        "basic notification",
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
    flutterLocalNotificationsPlugin.show(
        0, "basic notification", 'body', notificationDetails,
        payload: "payload data");
  }

  static void showRepeatedNotification() {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        "basic notification",
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
    flutterLocalNotificationsPlugin.periodicallyShow(0, "repeated notification",
        'body', RepeatInterval.everyMinute, notificationDetails,
        payload: "payload data");
  }

  static Future<void> showScheduleNotification(
      {String? title,
      String? reminder,
      required int year,
      required int month,
      required int day,
      required int hour,
      required int minute}) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        "schedule notification",
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      "$title",
      "$reminder",
      tz.TZDateTime(
        tz.local,
        year,
        month,
        day,
        hour,
        minute,

      ),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
