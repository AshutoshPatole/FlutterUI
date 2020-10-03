import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();
  List<String> convertOptions = ['centimeter', 'meter', 'kilometer'];

  String _convertTo, _convertFrom, _result;

  calculate(String data, String convertFrom, String convertTo) {
    try {
      double toCalculate = double.parse(data);
      print("$toCalculate  =>  $convertFrom  ==> $convertTo");
    } catch (e) {
      setState(() {
        _result = "Please enter numbers in textfield";
      });
      print("Error !");
    }
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff780206),
                  Color(0xff061161),
                ],
              ),
            ),
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Converter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DropdownButton(
                            dropdownColor: Colors.green,
                            hint: Text(
                              'From',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(color: Colors.white),
                            value: _convertFrom,
                            onChanged: (newValue) {
                              setState(() {
                                _convertFrom = newValue;
                              });
                            },
                            items: convertOptions.map((units) {
                              return DropdownMenuItem(
                                child: Text(units),
                                value: units,
                              );
                            }).toList(),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                          ),
                          DropdownButton(
                            dropdownColor: Colors.green,
                            hint: Text(
                              'To',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(color: Colors.white),
                            value: _convertTo,
                            onChanged: (newValue) {
                              setState(() {
                                _convertTo = newValue;
                              });
                            },
                            items: convertOptions.map((units) {
                              return DropdownMenuItem(
                                child: Text(units),
                                value: units,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      (_convertFrom == null || _convertTo == null)
                          ? TextFormField(
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Enter units",
                                enabled: false,
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : TextFormField(
                              controller: _controller,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              validator: (s) {
                                return (s.isEmpty)
                                    ? "Please enter something"
                                    : null;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Enter units",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      Text(_result ?? ' '),
                      RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            calculate(
                                _controller.text, _convertFrom, _convertTo);
                            _controller.clear();
                          }
                        },
                        elevation: 5,
                        hoverColor: Colors.green,
                        focusElevation: 10,
                        child: Text(
                          "Calculate",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
