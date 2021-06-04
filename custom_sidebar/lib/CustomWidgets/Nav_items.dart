import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final IconData iconData;
  final String menuItem;

  const MenuItem({Key key, this.iconData, this.menuItem}) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Icon(
              widget.iconData,
              color: Colors.white,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              widget.menuItem,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
