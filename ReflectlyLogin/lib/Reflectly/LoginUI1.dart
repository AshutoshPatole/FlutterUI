import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reflctlylogin/Custom_animations/delayed_animation.dart';

class LoginUI1 extends StatefulWidget {
  @override
  _LoginUI1State createState() => _LoginUI1State();
}

class _LoginUI1State extends State<LoginUI1>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;

  final color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AvatarGlow(
          endRadius: 90,
          duration: Duration(seconds: 2),
          glowColor: Colors.white24,
          repeat: true,
          repeatPauseDuration: Duration(seconds: 2),
          startDelay: Duration(seconds: 1),
          child: Material(
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: FlutterLogo(
                  size: 50.0,
                ),
                radius: 50.0,
              )),
        ),
        DelayedAnimation(
          child: Text("Hi Instagram",
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.bold, fontSize: 35.0, color: color)),
          delay: delayedAmount + 1000,
        ),
        DelayedAnimation(
          child: Text(
            "I'm Reflectly",
            style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold, fontSize: 35.0, color: color),
          ),
          delay: delayedAmount + 2000,
        ),
        SizedBox(
          height: 30.0,
        ),
        DelayedAnimation(
          child: Text(
            "Your New Personal",
            style: GoogleFonts.ubuntu(fontSize: 20.0, color: Colors.white70),
          ),
          delay: delayedAmount + 3000,
        ),
        DelayedAnimation(
          child: Text(
            "Journaling  companion",
            style: GoogleFonts.ubuntu(fontSize: 20.0, color: Colors.white70),
          ),
          delay: delayedAmount + 3000,
        ),
        SizedBox(
          height: 100.0,
        ),
      ],
    );
  }
}
