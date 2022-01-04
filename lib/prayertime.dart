import 'dart:ui';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:kkyprayertime/model.dart';
import 'package:intl/intl.dart';
import 'package:kkyprayertime/service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

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
            RefreshIndicator(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 27,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff5DC67B), Color(0xff9DDF8E)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      image: DecorationImage(
                        repeat: ImageRepeat.repeat,
                        image: AssetImage("asset/images/swatch4.png"),
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
                                  color: Colors.white.withOpacity(.5),
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
                                            onPressed: () {},
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
                                                    Text(
                                                      '${content.hijriDay} ${content.hijrimonth} ${content.hijriYear}',
                                                      style: GoogleFonts
                                                          .ibmPlexSans(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff3C4E40)),
                                                    ),
                                                    Text(
                                                      '${DateFormat.yMMMMEEEEd().format(aDateTime)}',
                                                      style: GoogleFonts
                                                          .ibmPlexSans(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xff3C4E40)),
                                                    ),
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
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20),
                                                        child: Row(
                                                          // mainAxisSize:
                                                          //  MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                'Fajr',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Icon(
                                                                CarbonIcons
                                                                    .mostly_cloudy_night,
                                                                color: Color(
                                                                    0xff3C4E40),
                                                                size: 34,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.subah}'))}',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20),
                                                        child: Row(
                                                          // mainAxisSize:
                                                          //  MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                'Sunrise',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                              ),
                                                            ),
                                                            const Expanded(
                                                              flex: 1,
                                                              child: Icon(
                                                                WeatherIcons
                                                                    .sunrise,
                                                                color: Color(
                                                                    0xff3C4E40),
                                                                size: 26,
                                                              ),

                                                              // Icon(
                                                              //   CarbonIcons
                                                              //       .partly_cloudy,
                                                              //   color: Color(
                                                              //       0xff3C4E40),
                                                              //   size: 34,
                                                              // ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.sunrise}'))}',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20),
                                                        child: Row(
                                                          // mainAxisSize:
                                                          //  MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                'Dhuhr',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                              ),
                                                            ),
                                                            const Expanded(
                                                              flex: 1,
                                                              child: Icon(
                                                                WeatherIcons
                                                                    .day_sunny,
                                                                color: Color(
                                                                    0xff3C4E40),
                                                                size: 26,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.luhar}'))}',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20),
                                                        child: Row(
                                                          // mainAxisSize:
                                                          //  MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                'Asr',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                              ),
                                                            ),
                                                            const Expanded(
                                                              flex: 1,
                                                              child: Icon(
                                                                WeatherIcons
                                                                    .horizon_alt,
                                                                color: Color(
                                                                    0xff3C4E40),
                                                                size: 26,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.asar}'))}',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20),
                                                        child: Row(
                                                          // mainAxisSize:
                                                          //  MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                'Sunset',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: const Color(
                                                                        0xff3C4E40)),
                                                              ),
                                                            ),
                                                            const Expanded(
                                                              flex: 1,
                                                              child: Icon(
                                                                WeatherIcons
                                                                    .sunset,
                                                                color: Color(
                                                                    0xff3C4E40),
                                                                size: 26,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.sunset}'))}',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20),
                                                        child: Row(
                                                          // mainAxisSize:
                                                          //  MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                'Maghrib',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Icon(
                                                                CarbonIcons
                                                                    .mostly_cloudy_night,
                                                                color: Color(
                                                                    0xff3C4E40),
                                                                size: 34,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.mahgrib}'))}',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20),
                                                        child: Row(
                                                          // mainAxisSize:
                                                          //  MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                'Isha',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Icon(
                                                                CarbonIcons
                                                                    .moon,
                                                                color: Color(
                                                                    0xff3C4E40),
                                                                size: 34,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                '${DateFormat.jm().format(DateFormat("hh:mm").parse('${content.isha}'))}',
                                                                style: GoogleFonts.ibmPlexSans(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Color(
                                                                        0xff3C4E40)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
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
}
