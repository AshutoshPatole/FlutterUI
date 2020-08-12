import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextField({this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xfffefefa),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.favorite,
            color: Color(0xffE85569),
            size: 22,
          ),
          hintStyle: GoogleFonts.poppins(),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
