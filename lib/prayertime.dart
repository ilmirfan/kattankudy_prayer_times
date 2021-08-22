import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kkyprayertime/model.dart';
import 'package:flutter/services.dart';
import 'package:kkyprayertime/service.dart';
import 'package:google_fonts/google_fonts.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({Key? key}) : super(key: key);

  @override
  _PrayerTimeState createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  // ignore: prefer_typing_uninitialized_variables
  // var times;

  Future<void> getRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      Service.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffe6dedc),

      body: RefreshIndicator(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff5DC67B), Color(0xff9DDF8E)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                image: DecorationImage(
                  // repeat: ImageRepeat.repeatY,
                  image: AssetImage("asset/images/oriental.png"),
                ),
              ),
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.menu,
                                  color: Colors.transparent,
                                ),
                                Spacer(),
                                Text(
                                  'Kattankudy',
                                  style: GoogleFonts.ibmPlexSans(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff3C4E40)),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: Color(0xff3C4E40),
                                    )),
                              ],
                            ),
                          ),
                          FutureBuilder<PrayerTimes?>(
                              future: Service.fetchData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var content = snapshot.data!;

                                  return Column(
                                    children: [
                                      Text(
                                        '${content.today}',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Color(0xff45877d)),
                                      ),
                                      Text(
                                        'Hijri:${content.hijri} ${content.hijrimonth}',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Color(0xff45877d)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            'Fajr:',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Color(0xff45877d)),
                                          ),
                                          Text(
                                            'Fajr: ${content.subah}',
                                            style: const TextStyle(
                                                fontSize: 24,
                                                color: Color(0xff45877d)),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Luhar: ${content.luhar}',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Color(0xff45877d)),
                                      ),
                                      Text(
                                        'Asr: ${content.asar}',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Color(0xff45877d)),
                                      ),
                                      Text(
                                        'Maghrib: ${content.mahgrib}',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Color(0xff45877d)),
                                      ),
                                      Text(
                                        'Isha: ${content.isha}',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Color(0xff45877d)),
                                      ),
                                      Text(
                                        'Sunrise: ${content.sunrise}',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Color(0xff45877d)),
                                      ),
                                      Text(
                                        'Sunset: ${content.sunset}',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Color(0xff45877d)),
                                      ),
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return const Center(
                                      child: Icon(Icons.error_outline));
                                } else {
                                  return Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      CircularProgressIndicator(),
                                    ],
                                  ));
                                }
//8193000050
                                //  return const Text('Unable to fetch data');
                              }),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
        onRefresh: getRefresh,
      ),
    );
  }
}
