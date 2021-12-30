import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Animations/teddycontroller.dart';
import 'package:portfolio/CustomWidegts/signinbtn.dart';
import 'package:portfolio/Helpers/text_input_tracker.dart';
import 'package:portfolio/Screens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TeddyController _teddyController;
  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 200,
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: FlareActor(
                  "assets/Teddy.flr",
                  shouldClip: false,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.contain,
                  controller: _teddyController,
                )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TrackingTextInput(
                          label: "Email",
                          hint: "Type abc@example.com",
                          style: TextStyle(color: Colors.white),
                          onCaretMoved: (Offset caret) {
                            _teddyController.lookAt(caret);
                          }),
                      TrackingTextInput(
                        label: "Password",
                        style: TextStyle(color: Colors.white),
                        isObscured: true,
                        onCaretMoved: (Offset caret) {
                          _teddyController.coverEyes(caret != null);
                          _teddyController.lookAt(null);
                        },
                        onTextChanged: (String value) {
                          _teddyController.setPassword(value);
                        },
                      ),
                      isloading
                          ? SigninButton(
                              child: CircularProgressIndicator(
                              backgroundColor: Colors.grey[200],
                            ))
                          : SigninButton(
                              child: Text("Sign In",
                                  style: TextStyle(
                                      fontFamily: "RobotoMedium",
                                      fontSize: 16,
                                      color: Colors.white)),
                              onPressed: () {
                                if (_teddyController.submitPassword()) {
                                  // next page routing
                                  setState(() {
                                    isloading = true;
                                  });
                                  Future.delayed(Duration(seconds: 2), () {
                                    Route route = MaterialPageRoute(
                                        builder: (context) => HomeScreen());
                                    Navigator.pushReplacement(context, route);
                                  });
                                } else {
                                  // error message popup
                                  showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      content: Text(
                                          "Please type \"panda\" as the password"),
                                      title: Text("Wrong Password"),
                                    ),
                                  );
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
