import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../resources/strings.dart';

class NotificationController {
  static final _notificationPlugin = FlutterLocalNotificationsPlugin();

  static final NotificationController instance = NotificationController._();

  NotificationController._() {
    init();
  }

  init() async {
    const android = AndroidInitializationSettings('');
    final iOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {
        // Trigger Notification
        triggerNotification(id, title, body, payload);
      },
    );

    final settings = InitializationSettings(android: android, iOS: iOS);

    _notificationPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {},
      onDidReceiveBackgroundNotificationResponse: (details) {},
    );
  }

  static void triggerNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    _notificationPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(androidChannelId, appName),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }
}
