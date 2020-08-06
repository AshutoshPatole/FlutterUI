import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController maleTextEditing = TextEditingController();
  TextEditingController femaleTextEditing = TextEditingController();
  Future _getData;
  // Querying to the API
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: maleTextEditing,
            ),
            TextField(
              controller: femaleTextEditing,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                _getData =
                    getData(maleTextEditing.text, femaleTextEditing.text);
              },
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
