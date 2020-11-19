import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show File, Platform;
// import 'package:rxdart/subject.dart';

class NotificationPlugin {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  // final BehaviorSubject<ReceivedNotification> didReceivedNotification =
  //     BehaviorSubject<ReceivedNotification>();
  NotificationPlugin._() {
    init();
  }

  init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _requestIOSPermission();
    }
    initializePlateformSpecifics();
  }

  initializePlateformSpecifics() {
    var initializeSettingAndroid =
        AndroidInitializationSettings('app_notf_icon');
    var initializeSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (id, title, body, playload) async {});
  }

  _requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(
          alert: false,
          badge: false,
          sound: true,
        );
  }
}

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String playload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.playload,
  });
}
