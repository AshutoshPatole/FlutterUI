import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animations/loading_animations.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController maleTextEditing = TextEditingController();
  TextEditingController femaleTextEditing = TextEditingController();

  void _showDialog(String maleName, String femaleName) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Love meter',
              style: GoogleFonts.pacifico(),
            ),
            content: FutureBuilder(
              future: getData(maleName, femaleName),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.percentage);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularPercentIndicator(
                        radius: 130.0,
                        animation: true,
                        animationDuration: 1200,
                        lineWidth: 15.0,
                        percent:
                            double.parse("${snapshot.data.percentage}") / 100,
                        center: Text(
                          "${snapshot.data.percentage}",
                          style: GoogleFonts.pacifico(
                            fontSize: 22,
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.red[50],
                        progressColor: Colors.pink[400],
                      ),
                      Text(
                        snapshot.data.result,
                        style: GoogleFonts.pacifico(
                          fontSize: 20,
                        ),
                      )
                    ],
                  );
                } else {
                  return LoadingBouncingGrid.square(
                    backgroundColor: Colors.red[100],
                  );
                }
              },
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Try again",
                  style: GoogleFonts.pacifico(
                    fontSize: 18,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Color(0xffE85569),
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            ],
          );
        });
  }

  // Querying to the API
  Future<Love> getData(String male, String female) async {
    final http.Response response = await http.get(
      'https://love-calculator.p.rapidapi.com/getPercentage?fname=$male&sname=$female',
      headers: {
        "x-rapidapi-host": "love-calculator.p.rapidapi.com",
        "x-rapidapi-key": "b624852d58msh78674b320191108p120ccdjsnf3f69cef9c31",
      },
    );
    if (response.statusCode == 200) {
      return Love.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Love');
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.pink[100],
        systemNavigationBarColor: Colors.pink[100]));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 180,
              child: Image(
                image: AssetImage("assets/logo.png"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Love',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pacifico(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffE85569),
                  ),
                ),
                Text(
                  ' Calculator',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pacifico(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Text(
                    'your name',
                    style: GoogleFonts.pacifico(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xfffefefa),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      controller: maleTextEditing,
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
                  ),
                  SizedBox(height: 15),
                  Text(
                    'your loved one name',
                    style: GoogleFonts.pacifico(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xfffefefa),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      controller: femaleTextEditing,
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            RaisedButton(
              onPressed: () {
                _showDialog(maleTextEditing.text, femaleTextEditing.text);
                setState(() {
                  isLoading = true;
                });
              },
              child: Text(
                'Calculate',
                style: GoogleFonts.pacifico(
                  fontSize: 22,
                ),
              ),
              color: Color(0xffE85569),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Love {
  final String percentage;
  final String result;
  final String maleName;
  final String femaleName;

  Love({
    this.percentage,
    this.result,
    this.maleName,
    this.femaleName,
  });
  factory Love.fromJson(Map<String, dynamic> json) {
    return Love(
        maleName: json['sname'],
        femaleName: json['fname'],
        percentage: json['percentage'],
        result: json['result']);
  }
}
