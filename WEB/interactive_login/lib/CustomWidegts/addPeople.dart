import 'package:flutter/material.dart';

class AddPeople extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.notifications,
          color: Colors.grey[600],
        ),
        IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.blue,
            ),
            onPressed: () {}),
      ],
    );
  }
}
