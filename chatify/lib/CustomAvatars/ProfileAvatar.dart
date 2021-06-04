import 'package:flutter/material.dart';

class ProfileAvatar extends StatefulWidget {
  final String link;
  final String name;

  const ProfileAvatar({Key key, this.link, this.name});

  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(widget.link),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Icon(
              Icons.cancel,
              size: 20,
              color: Color(0xfff06830),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 8,
          child: Text(widget.name),
        )
      ],
    );
  }
}

class ProfilePicture extends StatefulWidget {
  final String link;

  const ProfilePicture({Key key, this.link});

  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(widget.link),
    );
  }
}
