import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xff303060),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.white24,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search what you want',
                  hintStyle: TextStyle(color: Colors.white24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
