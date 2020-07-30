import 'package:flutter/material.dart';
import 'package:fruits_app/Widgets/appBar.dart';
import 'package:fruits_app/Widgets/fruitsView.dart';
import 'package:fruits_app/Widgets/searchBox.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TopBar(
                  color: Colors.black12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Text(
                  "Fruits and berries",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SearchBox(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                FruitsView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
