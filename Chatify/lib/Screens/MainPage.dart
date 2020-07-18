import 'package:chatapp/ColorBubbles/greenColor.dart';
import 'package:chatapp/ColorBubbles/orangeColor.dart';
import 'package:chatapp/ColorBubbles/pinkcolor.dart';
import 'package:chatapp/ColorBubbles/yellowColor.dart';
import 'package:chatapp/CustomAvatars/OnlineAvatar.dart';
import 'package:chatapp/CustomAvatars/ProfileAvatar.dart';
import 'package:chatapp/Data/Data_File.dart';
import 'package:chatapp/Data/Utils.dart';
import 'package:chatapp/Screens/CreateGroup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils().greenColor,
      body: Stack(
        children: <Widget>[
          PinkColor(),
          GreenColor(),
          OrangeColor(),
          Positioned(
            top: -90,
            left: 40,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                color: Utils().yellowColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
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
              "Chatify",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 28,
                  letterSpacing: 0.8),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Card(
                color: Colors.black87,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 8),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                            focusColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width,
            child: Online(),
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
              child: ListView.builder(
                  itemCount: list.length,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemExtent: 76,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            children: <Widget>[
                              list[index],
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    names[index],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    numbers[index],
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70.0, right: 20),
                          child: Divider(
                            thickness: 0.8,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Utils().orangeColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateGroup()));
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}

List list = [
  OnlineAvatar(
    link: 'https://www.randomlists.com/img/people/dave_matthews.webp',
  ),
  ProfilePicture(
    link: 'https://www.randomlists.com/img/people/johnny_cash.webp',
  ),
  OnlineAvatar(
    link: 'https://www.randomlists.com/img/people/danielle_steel.webp',
  ),
  ProfilePicture(
    link: 'https://www.randomlists.com/img/people/mariska_hargitay.webp',
  ),
  ProfilePicture(
    link: 'https://www.randomlists.com/img/people/ellen_degeneres.webp',
  ),
  ProfilePicture(
    link: 'https://www.randomlists.com/img/people/drew_barrymore.webp',
  ),
];

List names = [
  'Brandon',
  'John',
  'Disha',
  'Danielle',
  'Anne',
  'Daina',
];
List numbers = [
  '9003265555',
  '7894612301',
  '8637447230',
  '9884766103',
  '8793413526',
  '8805040966',
];
