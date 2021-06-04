import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reflctlylogin/Reflectly/HomePage.dart';

class LastPage extends StatefulWidget {
  final fn;

  const LastPage({Key key, this.fn}) : super(key: key);

  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
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
          top: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.9,
          left: MediaQuery.of(context).size.width * 0.05,
          child: Text(
            "Last thing - want me to send your data to cloud?",
            style: GoogleFonts.ubuntu(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          left: MediaQuery.of(context).size.width * 0.25,
          right: MediaQuery.of(context).size.width * 0.25,
          child: Icon(
            Icons.cloud_upload,
            color: Colors.white70,
            size: 150,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          left: MediaQuery.of(context).size.width * 0.25,
          child: Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReflectlyHomePage()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
                  child: Text(
                    "YES  PLEASE!",
                    style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        color: Color(0xFF8185E2),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.81,
          left: MediaQuery.of(context).size.width * 0.37,
          child: Container(
            child: Text(
              "NO THANKS",
              style: GoogleFonts.ubuntu(fontSize: 18, color: Colors.white70),
            ),
          ),
        )
      ],
    );
  }
}
