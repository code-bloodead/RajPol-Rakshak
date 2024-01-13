import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:rakshak/data/models/notification/notification_model.dart';
import 'package:rakshak/data/repository/repository.dart';
import 'package:rakshak/core/app_export.dart';

class BackgroundService {
  static List<String> notifList = [];
  static var _mobile = PrefUtils().getMobile();
  static var getNotifResp = GetNotificationResp(dataList: []);
  static var _repository = Repository();
  static Future<void> initialize() async {
    PrefUtils().init();
    final service = FlutterBackgroundService();
    await service.configure(
        iosConfiguration: IosConfiguration(), // not implemented yet
        androidConfiguration: AndroidConfiguration(
            onStart: onStart,
            isForegroundMode: false,
            autoStart: false,
            autoStartOnBoot: false));
    // await service.startService();
  }

  static Future<void> startBackground() async {
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    if (!isRunning) {
      await PrefUtils().init();
      _mobile = PrefUtils().getMobile();
      await service.startService();
      FlutterBackgroundService().invoke("setAsBackground");
    }
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
    await PrefUtils().init();
    await dotenv.load(fileName: ".env");
    _repository = Repository();
    Future.delayed(Duration(seconds: 5), () async {
      if (service is AndroidServiceInstance) {
        try {
          Timer.periodic(const Duration(seconds: 10), (timer) async {
            if (_mobile == "") {
              await PrefUtils().init();
              _mobile = PrefUtils().getMobile();
            }
            getNotifResp = await _repository.getNotifications(_mobile);

            if (getNotifResp.dataList!.length > 0) {
              if (PrefUtils().getNotificationList().length == 0) {
                getNotifResp.dataList!.forEach((element) {
                  notifList.add(element.id!);
                });
                await PrefUtils().setNotificationList(notifList);
                if (notifList.length > 1) {
                  String len = notifList.length.toString();
                  LocalNotifications.showSimpleNotification(
                      title: "$len new notifications",
                      body: "Reported incidents status has been updated",
                      payload: "payload");
                } else if (notifList.length == 1) {
                  LocalNotifications.showSimpleNotification(
                      title: getNotifResp.dataList!.first.title!,
                      body: getNotifResp.dataList!.first.description!,
                      payload: "payload");
                }
              } else {
                if (PrefUtils().getNotificationList().length > 0 &&
                    getNotifResp.dataList!.length > 0 &&
                    PrefUtils().getNotificationList().first !=
                        getNotifResp.dataList!.first.id!) {
                  getNotifResp.dataList!.forEach((element) {
                    notifList.add(element.id!);
                  });
                  await PrefUtils().setNotificationList(notifList);
                  if (getNotifResp.dataList!.length > 1) {
                    String len = getNotifResp.dataList!.length.toString();
                    LocalNotifications.showSimpleNotification(
                        title: "$len new notifications",
                        body: "Reported incidents status has been updated",
                        payload: "payload");
                  } else if (getNotifResp.dataList!.length == 1) {
                    LocalNotifications.showSimpleNotification(
                        title: getNotifResp.dataList!.first.title!,
                        body: getNotifResp.dataList!.first.description!,
                        payload: "payload");
                  }
                } else {
                  print("No new notifications");
                }
              }
            } else {
              PrefUtils().setNotificationList([]);
              print("No notifications");
            }
          });
        } catch (error) {
          print(error);
        }
      }
    });
  }
}
