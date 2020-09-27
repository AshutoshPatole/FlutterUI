import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
