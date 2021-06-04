import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var squareScaleA = 0.5;
  var squareScaleB = 0.5;
  AnimationController _controllerA;
  AnimationController _controllerB;

  @override
  void initState() {
    _controllerA = AnimationController(
        vsync: this,
        lowerBound: 0.5,
        upperBound: 1.0,
        duration: Duration(milliseconds: 100));
    _controllerA.addListener(() {
      setState(() {
        squareScaleA = _controllerA.value;
      });
    });
    _controllerB = AnimationController(
        vsync: this,
        lowerBound: 0.5,
        upperBound: 1.0,
        duration: Duration(milliseconds: 100));
    _controllerB.addListener(() {
      setState(() {
        squareScaleB = _controllerB.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerA.dispose();
    _controllerB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bounce Example"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: 300.0,
            height: 150.0,
            color: Colors.yellowAccent,
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (_controllerA.isCompleted) {
                        _controllerA.reverse();
                      } else {
                        _controllerA.forward(from: 0.0);
                      }
                    },
                    child: Transform.scale(
                      scale: squareScaleA,
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_controllerB.isCompleted) {
                        _controllerB.reverse();
                      } else {
                        _controllerB.forward(from: 0.0);
                      }
                    },
                    child: Transform.scale(
                      scale: squareScaleB,
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
