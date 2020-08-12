import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLabel extends StatelessWidget {
  final String labelName;

  const TextLabel({this.labelName});
  @override
  Widget build(BuildContext context) {
    return Text(
      '$labelName',
      style: GoogleFonts.pacifico(
        fontSize: 25,
        color: Colors.black,
      ),
    );
  }
}