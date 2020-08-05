import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/models/sampleData.dart';
import 'package:google_fonts/google_fonts.dart';

class FruitsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 4,
      scrollDirection: Axis.vertical,
      itemCount: fruits.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: fruitColor[index].withOpacity(0.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 10,
                left: 20,
                child: Text(
                  fruits[index],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: MediaQuery.of(context).size.height * 0.04,
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.dollarSign,
                      size: 12,
                    ),
                    Text(
                      price[index],
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: index.isEven
                    ? MediaQuery.of(context).size.height * 0.08
                    : MediaQuery.of(context).size.height * 0.05,
                left: 20,
                child: Container(
                  width: index.isEven ? 125 : 100,
                  height: index.isEven ? 125 : 100,
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 1.5,
                right: -10,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: fruitColor[index].withOpacity(1)),
                    borderRadius: BorderRadius.circular(14.5),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: fruitColor[index].withOpacity(1).withAlpha(3000),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2.9 : 2.1),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}
