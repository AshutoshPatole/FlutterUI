import '../ColorBubbles/greenColor.dart';
import '../ColorBubbles/orangeColor.dart';
import '../ColorBubbles/pinkcolor.dart';
import '../ColorBubbles/yellowColor.dart';
import '../CustomAvatars/CustomAvatar.dart';
import '../Data/Data_File.dart';
import '../Data/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils().greenColor,
      body: Stack(
        children: <Widget>[
          PinkColor(),
          OrangeColor(),
          GreenColor(),
          YellowColor(),
          Positioned(
            top: 30,
            left: 20,
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 35,
            left: MediaQuery.of(context).size.width * 0.37,
            child: Text(
              "New Group",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 0.8),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            right: MediaQuery.of(context).size.width * 0.2,
            left: MediaQuery.of(context).size.width * 0.2,
            child: CustomAvatar(
              bgColor: Utils().blackColor,
              circleRadius: 50,
              iconColor: Utils().whiteColor,
              iconData: Icons.perm_identity,
              iconRadius: 50,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            right: MediaQuery.of(context).size.width * 0.35,
            child: CustomAvatar(
              bgColor: Utils().blackColor,
              circleRadius: 20,
              iconColor: Utils().whiteColor,
              iconData: Icons.mode_edit,
              iconRadius: 20,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.32,
            left: MediaQuery.of(context).size.width * 0.35,
            right: MediaQuery.of(context).size.width * 0.35,
            child: Text(
              "Group Name",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.36,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              "Provide a group subject and optional group icon",
              style: TextStyle(color: Colors.black, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.45,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.98),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          "Participants",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              letterSpacing: 0.8),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.yellow[700],
                        radius: 12,
                        child: Center(
                            child: Text(
                          "8",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Data(),
                  SizedBox(
                    height: 20,
                  ),
                  Data2(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Utils().orangeColor,
              onPressed: () {},
              child: Icon(Icons.arrow_forward),
            ),
          )
        ],
      ),
    );
  }
}
