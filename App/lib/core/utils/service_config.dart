import 'dart:async';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:rakshak/core/app_export.dart';

class BackgroundService {
  static int _counter = 0;
  static Future<void> initialize() async {
    final service = FlutterBackgroundService();
    await service.configure(
        iosConfiguration: IosConfiguration(), // not implemented yet
        androidConfiguration: AndroidConfiguration(
            onStart: onStart,
            isForegroundMode: false,
            autoStart: true,
            autoStartOnBoot: true));
    await service.startService();
  }

  static void startBackground() {
    FlutterBackgroundService().invoke("setAsBackground");
  }

  static void stopBackground() async {
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    if (isRunning) {
      service.invoke("stopService");
    }
  }

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance service) async {
    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });

      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (service is AndroidServiceInstance) {
        // LocalNotifications.showSimpleNotification(
        //     title: "title $_counter", body: "body", payload: "payload");
        ++_counter;
      }
    });
  }
}
