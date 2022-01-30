import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key, required this.titleTextValue}) : super(key: key);
  final titleTextValue;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleTextValue,
      style: GoogleFonts.ibmPlexSans(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: const Color(0xff3C4E40)),
    );
  }
}
