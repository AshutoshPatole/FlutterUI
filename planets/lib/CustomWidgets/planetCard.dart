import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlanetCard extends StatelessWidget {
  final String planetNumber;
  final String planetName;

  const PlanetCard({this.planetNumber, this.planetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xff303060),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 30,
            top: 20,
            child: Text(
              planetNumber,
              style: TextStyle(
                color: Colors.brown[300],
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 40,
            bottom: 60,
            child: Text(
              planetName,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 45,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 40,
            bottom: 30,
            child: Row(
              children: <Widget>[
                Text(
                  'Know more',
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  FontAwesomeIcons.longArrowAltRight,
                  color: Colors.brown,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
