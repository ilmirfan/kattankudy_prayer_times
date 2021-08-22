import 'model.dart';
import 'package:http/http.dart' as http;
import 'package:kkyprayertime/model.dart';
import 'dart:convert';

class Service {
  static Future<PrayerTimes?> fetchData() async {
    try {
      const url =
          'http://api.aladhan.com/v1/timingsByCity?city=Kattankudy&country=Sri%20Lanka&method=3&tune=0,-5,2,2,4,1,0,6';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return PrayerTimes?.fromJason(json.decode(response.body));
      } else {
        throw Exception('Failed to load api');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
