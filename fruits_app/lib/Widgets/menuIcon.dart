import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          MenuLines(
            height: 2,
            width: 20,
          ),
          const SizedBox(
            height: 5,
          ),
          MenuLines(
            height: 2,
            width: 12,
          ),
        ],
      ),
    );
  }
}

class MenuLines extends StatelessWidget {
  final double width;
  final double height;

  const MenuLines({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
