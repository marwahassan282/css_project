import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'local_notification_service.dart';

class AlarmManager{



  static void oneShotAtTaskCallback(String title,String body) {
    LocalNotificationService.showNotification(id: 0,title: 'hello',body: 'every thing will be ok');
  }
  static void oneShotTaskCallback(String title,String body){

    LocalNotificationService.showNotification(id: 0,title: title,body: body);
  }

  static void scheduleOneShotAlarm(bool isTimed,DateTime dateTime) async {
    if (isTimed) {
     // DateTime chosenDate = DateTime.now();
      await AndroidAlarmManager.oneShotAt(dateTime, 0, oneShotAtTaskCallback,);
    } else {
    //  Duration duration = Duration(microseconds: 6);
      await AndroidAlarmManager.oneShot(Duration(milliseconds: 5), 1, oneShotTaskCallback);
    }
  }
}