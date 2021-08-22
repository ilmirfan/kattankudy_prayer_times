import 'package:flutter/material.dart';
import 'package:kkyprayertime/prayertime.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kattankudy Prayer Times',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PrayerTime(),
    );
  }
}
