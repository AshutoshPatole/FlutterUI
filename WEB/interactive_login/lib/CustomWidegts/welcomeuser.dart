import 'package:flutter/material.dart';

class WelcomeUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: width < 791
          ? EdgeInsets.symmetric(horizontal: 1, vertical: 0)
          : EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      // margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[700],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome John, ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "Manage all the things from single Dashboard like HRMS, PMS. Recruitement. and all the things.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.asset("assets/team.png"),
          ),
        ],
      ),
    );
  }
}
