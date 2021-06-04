import 'package:flutter/material.dart';

class CustomAvatar extends StatefulWidget {
  final Color bgColor;
  final Color iconColor;
  final IconData iconData;
  final double circleRadius;
  final double iconRadius;

  CustomAvatar(
      {Key key,
      this.bgColor,
      this.iconColor,
      this.iconData,
      this.circleRadius,
      this.iconRadius});

  @override
  _CustomAvatarState createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
      child: CircleAvatar(
        backgroundColor: widget.bgColor,
        radius: widget.circleRadius,
        child: Icon(
          widget.iconData,
          color: widget.iconColor,
          size: widget.iconRadius,
        ),
      ),
    );
  }
}
