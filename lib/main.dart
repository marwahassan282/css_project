import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:c_s_s/provide.dart';
import 'package:c_s_s/services/alarm.dart';
import 'package:c_s_s/services/local_notification_service.dart';
import 'package:c_s_s/study/Circuits/Circuits.dart';
import 'package:c_s_s/study/Circuits/Lecture.dart';
import 'package:c_s_s/study/Circuits/Section.dart';


import 'package:c_s_s/study/Type_Stady.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

import 'enter.dart';
import 'home/homescreen.dart';
import 'login/login.dart';


LocalNotificationService localNotificationService=LocalNotificationService();
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    AlarmManager.scheduleOneShotAlarm(true,DateTime.now());
    return Future.value(true);
  });
}

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();

 await Workmanager().initialize(callbackDispatcher);

  await AndroidAlarmManager.initialize();
localNotificationService.init();
  await  Firebase.initializeApp();


  runApp(MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (BuildContext context) => AdminPanel())   ,

      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

        TypeStudy.routName:(v)=>TypeStudy(),
GoScreen.routeName:(c)=>GoScreen(),





      },
      initialRoute:GoScreen.routeName ,
      home:  TypeStudy(),
    );
  }
}


