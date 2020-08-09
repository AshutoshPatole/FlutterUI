import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController maleTextEditing = TextEditingController();
  TextEditingController femaleTextEditing = TextEditingController();
  Future _getData;

  // Querying to the API

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Care Calculator says',
            style: GoogleFonts.pacifico(),
          ),
        );
      }

    );
  }
  Future getData(String male, String female) async {
    final http.Response response = await http.get(
      'https://love-calculator.p.rapidapi.com/getPercentage?fname=$male&sname=$female',
      headers: {
        "x-rapidapi-host": "love-calculator.p.rapidapi.com",
        "x-rapidapi-key": "b624852d58msh78674b320191108p120ccdjsnf3f69cef9c31",
      },
    );
    if (response.statusCode == 200) {
      setState(() {});
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Love');
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          )
        ),
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
                  'Care',
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
                        hintText: 'Ashutosh',
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
                        hintText: 'Arijit Singh',
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
                _showDialog();
                setState(() {
                  isLoading = true;
                });
                _getData =
                    getData(maleTextEditing.text, femaleTextEditing.text);
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
            FutureBuilder(
              future: _getData,
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Center(
                    child:
                        isLoading ? CircularProgressIndicator() : Container(),
                  );
                } else {
                  return Column(
                    children: [],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
