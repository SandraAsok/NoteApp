import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox kheight20 = const SizedBox(height: 20);
SizedBox kheight10 = const SizedBox(height: 10);

Color maincolor = Colors.yellow.shade300;
Color appbarcolor = Colors.orangeAccent.shade200;

List<Color> cardscolor = [
  Colors.pink.shade200,
  Colors.red.shade300,
  Colors.green.shade300,
  Colors.blue.shade300,
];

TextStyle appbarstyle = GoogleFonts.abel(
    fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);

TextStyle headingstyle = GoogleFonts.abel(
  fontSize: 25,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

TextStyle normalstyle = GoogleFonts.abel(
  fontSize: 22,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

TextStyle titlestyle = GoogleFonts.roboto(
  fontSize: 23,
  fontWeight: FontWeight.bold,
);

TextStyle contentstyle = GoogleFonts.nunito(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

TextStyle datestyle = GoogleFonts.roboto(
  fontSize: 13,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
