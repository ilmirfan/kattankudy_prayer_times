import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimingWidget extends StatelessWidget {
  const TimingWidget(
      {Key? key,
      required this.prayerTitle,
      required this.prayerTimeIcon,
      required this.prayerTime,
      this.iconSize = 26})
      : super(key: key);

  final String prayerTitle;
  final IconData prayerTimeIcon;
  final String prayerTime;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // mainAxisSize:
        //  MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              prayerTitle,
              style: GoogleFonts.ibmPlexSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff3C4E40)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(
              prayerTimeIcon,
              color: Color(0xff3C4E40),
              size: iconSize,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              prayerTime,
              style: GoogleFonts.ibmPlexSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff3C4E40)),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
