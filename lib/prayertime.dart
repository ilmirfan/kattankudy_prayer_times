import 'dart:ui';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:kkyprayertime/model.dart';
import 'package:intl/intl.dart';
import 'package:kkyprayertime/service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkyprayertime/widgets/timing.dart';
import 'package:kkyprayertime/widgets/title_text.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xffe6dedc),

        body: Column(
          children: [
            //pull to refresh currently not working because I am using Column on the top. Should be changed to ListView or some scrollable widget.
            RefreshIndicator(
              child: Column(
                children: [
                  Container(
                    //something I messedup here with the layout. I don't know the problem with my device or my code.
                    height: kIsWeb
                        ? MediaQuery.of(context).size.height
                        : MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff5DC67B), Color(0xff9DDF8E)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      image: DecorationImage(
                        repeat: ImageRepeat.repeat,
                        image: AssetImage("asset/images/pattern2.png"),
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              // height: MediaQuery.of(context).size.height - 200,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.menu,
                                          color: Colors.transparent,
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Kattankudy',
                                          style: GoogleFonts.ibmPlexSans(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xff3C4E40)),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              creditAlert(context);
                                            },
                                            icon: const Icon(
                                              Icons.more_vert,
                                              color: Color(0xff3C4E40),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: FutureBuilder<PrayerTimes?>(
                                        future: Service.fetchData(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            var content = snapshot.data!;
                                            DateTime aDateTime = DateTime.now();
                                            return Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    TitleText(
                                                        titleTextValue:
                                                            '${content.hijriDay} ${content.hijrimonth} ${content.hijriYear}'),
                                                    TitleText(
                                                        titleTextValue:
                                                            '${DateFormat.yMMMMEEEEd().format(aDateTime)}'),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Divider(),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TimingWidget(
                                                        prayerTitle: 'Fajr',
                                                        prayerTimeIcon: CarbonIcons
                                                            .mostly_cloudy_night,
                                                        prayerTime:
                                                            '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.subah}'))}',
                                                        iconSize: 34,
                                                      ),
                                                      Divider(),
                                                      TimingWidget(
                                                        prayerTitle: 'Sunrise',
                                                        prayerTimeIcon:
                                                            WeatherIcons
                                                                .sunrise,
                                                        prayerTime:
                                                            '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.sunrise}'))}',
                                                      ),
                                                      Divider(),
                                                      TimingWidget(
                                                        prayerTitle: 'Dhuhr',
                                                        prayerTimeIcon:
                                                            WeatherIcons
                                                                .day_sunny,
                                                        prayerTime:
                                                            '${DateFormat.jm().format(DateFormat("HH:mm").parse('${content.luhar}'))}',
                                                      ),
                                                      Divider(),
                                                      TimingWidget(
                                                        prayerTitle: 'Asr',
                                                        prayerTimeIcon:
                                                            WeatherIcons
                                                                .horizon_alt,
                                                        prayerTime:
                                                            '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.asar}'))}',
                                                      ),
                                                      Divider(),
                                                      TimingWidget(
                                                        prayerTitle: 'Sunset',
                                                        prayerTimeIcon:
                                                            WeatherIcons.sunset,
                                                        prayerTime:
                                                            '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.sunset}'))}',
                                                      ),
                                                      Divider(),
                                                      TimingWidget(
                                                        prayerTitle: 'Maghrib',
                                                        prayerTimeIcon: CarbonIcons
                                                            .mostly_cloudy_night,
                                                        prayerTime:
                                                            '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.mahgrib}'))}',
                                                        iconSize: 34,
                                                      ),
                                                      Divider(),
                                                      TimingWidget(
                                                        prayerTitle: 'Isha',
                                                        prayerTimeIcon:
                                                            CarbonIcons.moon,
                                                        prayerTime:
                                                            '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.isha}'))}',
                                                        iconSize: 26,
                                                      ),
                                                      Divider(),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (snapshot.hasError) {
                                            return const Center(
                                                child:
                                                    Icon(Icons.error_outline));
                                          } else {
                                            return Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                CircularProgressIndicator(),
                                              ],
                                            ));
                                          }
                                          //8193000050
                                          //  return const Text('Unable to fetch data');
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              onRefresh: getRefresh,
            ),
          ],
        ),
      ),
    );
  }

  void creditAlert(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) {
          return AlertDialog(
            contentPadding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
            content: Container(
              height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.6),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'KKY Prayer',
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff3C4E40)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Developed by',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(flex: 3, child: Text('Irfan Ishak')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Designed by',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(flex: 3, child: Text('VV')),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Backgroud pattern',
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(child: Text('GarryKillian / Freepik')),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
