import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kkyprayertime/prayertime.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, //Color(0xffFFF6EC), // status bar color
    statusBarBrightness: Brightness.dark, //status bar brightness
    statusBarIconBrightness: Brightness.dark, //status bar icon brightness
    systemNavigationBarColor:
        Colors.transparent, //Color(0xffFFF6EC), // navigation bar color
    systemNavigationBarDividerColor:
        Color(0xffFFF6EC), //Navigation bar divider color
    systemNavigationBarIconBrightness:
        Brightness.dark, //navigation bar icon brightness
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KKY Prayer',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          dividerTheme: const DividerThemeData(
              color: Color(0xff9DA79F), thickness: 0.25)),
      home: const PrayerTime(),
    );
  }
}
