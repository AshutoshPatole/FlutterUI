import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AskName extends StatefulWidget {
  final navigate;

  const AskName({Key? key, this.navigate}) : super(key: key);

  @override
  _AskNameState createState() => _AskNameState();
}

class _AskNameState extends State<AskName> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          child: AvatarGlow(
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Center(
                child: FlutterLogo(),
              ),
            ),
            endRadius: 50.0,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.2,
          left: MediaQuery.of(context).size.height * 0.035,
          right: MediaQuery.of(context).size.height * 0.035,
          child: Text(
            "Nice to meet you! What do your friends call you?",
            style: GoogleFonts.ubuntu(fontSize: 24, color: Colors.white),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          left: MediaQuery.of(context).size.width * 0.1,
          child: TextField(
            decoration: InputDecoration(
              hintText: "They call me ..",
              border: InputBorder.none,
              hintStyle:
                  GoogleFonts.ubuntu(color: Colors.white70, fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
