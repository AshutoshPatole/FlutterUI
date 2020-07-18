import 'package:flutter/material.dart';

class OnlineAvatar extends StatefulWidget {
  final String link;

  const OnlineAvatar({Key key, this.link});

  @override
  _OnlineAvatarState createState() => _OnlineAvatarState();
}

class _OnlineAvatarState extends State<OnlineAvatar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(widget.link),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Colors.lightGreenAccent,
                radius: 6,
              )),
        ),
      ],
    );
  }
}
