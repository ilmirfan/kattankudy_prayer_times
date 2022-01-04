class PrayerTimes {
  String today;
  String subah;
  String luhar;
  String asar;
  String mahgrib;
  String isha;
  String hijri;
  String hijrimonth;
  String sunrise;
  String sunset;
  String hijriDay;
  String hijriYear;

  PrayerTimes(
      {required this.today,
      required this.subah,
      required this.luhar,
      required this.asar,
      required this.mahgrib,
      required this.isha,
      required this.hijri,
      required this.hijrimonth,
      required this.sunrise,
      required this.sunset,
      required this.hijriDay,
      required this.hijriYear});

  factory PrayerTimes.fromJason(Map<String, dynamic> json) {
    return PrayerTimes(
        today: json['data']['date']['readable'],
        subah: json['data']['timings']['Fajr'],
        luhar: json['data']['timings']['Dhuhr'],
        asar: json['data']['timings']['Asr'],
        mahgrib: json['data']['timings']['Maghrib'],
        isha: json['data']['timings']['Isha'],
        sunrise: json['data']['timings']['Sunrise'],
        sunset: json['data']['timings']['Sunset'],
        hijri: json['data']['date']['hijri']['date'],
        hijrimonth: json['data']['date']['hijri']['month']['en'],
        hijriDay: json['data']['date']['hijri']['day'],
        hijriYear: json['data']['date']['hijri']['year']);
  }
}
