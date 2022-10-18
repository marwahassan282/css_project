import 'package:flutter_local_notifications/flutter_local_notifications.dart';



class LocalNotificationService {


 static final _localNotificationService = FlutterLocalNotificationsPlugin();

static Future showNotification({required int id ,var title,var body,var payload})async=>_localNotificationService.show(id, title, body,await notificationDetails());

  Future<void> init()async{

var initialAndroidsetting=AndroidInitializationSettings('drawable/css');
var initialIossettings=  IOSInitializationSettings();
final setting=InitializationSettings(

  android: initialAndroidsetting,
  iOS: initialIossettings);
  await _localNotificationService.initialize(setting);

}











  static notificationDetails()async {


  return await NotificationDetails(

    android: AndroidNotificationDetails(
      'channel id',
      'channel name',
      importance: Importance.max,
        playSound: true,
        priority: Priority.max,
        sound: RawResourceAndroidNotificationSound('notification'),



    ),
    iOS: IOSNotificationDetails()
  );
  }}
