import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'model/received_notification_view_model.dart';

class NotificationController {
  static final StreamController<ReceivedNotificationViewModel>
      didReceiveLocalNotificationStream =
      StreamController<ReceivedNotificationViewModel>.broadcast();

  /// A notification action which triggers a App navigation event
  static const String navigationActionId = 'id_3';

  /// Defines a iOS/MacOS notification category for text input actions.
  static const String darwinNotificationCategoryText = 'textCategory';

  /// Defines a iOS/MacOS notification category for plain actions.
  static const String darwinNotificationCategoryPlain = 'plainCategory';

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<FirebaseApp> initializeFireBaseApp({
    final FirebaseOptions? options,
  }) async =>
      Firebase.initializeApp(
        options: options,
      );

  static void startNotification() {
    final initializationSettings = initSetting();
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _requestPermissions();

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,);

    FirebaseMessaging.onMessage.listen((final event) {
      _showNotification(
        title: '${event.notification?.title}',
        body: '${event.notification?.body}',
      );
    });

    didReceiveLocalNotificationStream.stream.listen((final event) {
      _showNotification(
        title: event.title ?? '',
        body: event.body ?? '',
      );
    });
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(final NotificationResponse response) {
    print(response);
    /*_showNotification(
      title:  response.,
      body: 'bodyyyyyyyyy',
    );*/
  }

  static InitializationSettings initSetting() => InitializationSettings(
        android: initSettingsAndroid(),
        iOS: initSettingIOS(),
      );

  static DarwinInitializationSettings initSettingIOS() =>
      DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: (
          final id,
          final title,
          final body,
          final payload,
        ) async {
          didReceiveLocalNotificationStream.add(
            ReceivedNotificationViewModel(
              id: id,
              title: title,
              body: body,
              payload: payload,
            ),
          );
        },
        notificationCategories: <DarwinNotificationCategory>[
          DarwinNotificationCategory(
            darwinNotificationCategoryText,
            actions: <DarwinNotificationAction>[
              DarwinNotificationAction.text(
                'text_1',
                'Action 1',
                buttonTitle: 'Send',
                placeholder: 'Placeholder',
              ),
            ],
          ),
          DarwinNotificationCategory(
            darwinNotificationCategoryPlain,
            actions: <DarwinNotificationAction>[
              DarwinNotificationAction.plain('id_1', 'Action 1'),
              DarwinNotificationAction.plain(
                'id_2',
                'Action 2',
                options: <DarwinNotificationActionOption>{
                  DarwinNotificationActionOption.destructive,
                },
              ),
              DarwinNotificationAction.plain(
                navigationActionId,
                'Action 3',
                options: <DarwinNotificationActionOption>{
                  DarwinNotificationActionOption.foreground,
                },
              ),
              DarwinNotificationAction.plain(
                'id_4',
                'Action 4',
                options: <DarwinNotificationActionOption>{
                  DarwinNotificationActionOption.authenticationRequired,
                },
              ),
            ],
            options: <DarwinNotificationCategoryOption>{
              DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
            },
          ),
        ],
      );

  static AndroidInitializationSettings initSettingsAndroid() =>
      const AndroidInitializationSettings('@mipmap/ic_stat_careberry_logo');

  @pragma('vm:entry-point')
  static Future<void> _showNotification({
    final String? title,
    final String? body,
  }) async {
    /// dont use const here
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'Careberry_app_id',
      'Careberry',
      importance: Importance.max,
      colorized: true,
      playSound: true,
      showProgress: true,
      color: Colors.green,
      priority: Priority.max,
      icon: '@mipmap/ic_stat_careberry_logo',
      styleInformation: BigTextStyleInformation(''),
    );

    final DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails(
      presentBadge: true,
      presentAlert: true,
      presentSound: true,
      categoryIdentifier: darwinNotificationCategoryPlain,
    );

    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  static Future<void> _requestPermissions() async {
    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
            critical: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
            critical: true,
          );
    } else {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestPermission();
    }
  }
}
