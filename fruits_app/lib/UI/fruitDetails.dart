import 'package:flutter/material.dart';
import 'package:fruits_app/Widgets/appBar.dart';

class FruitDetails extends StatelessWidget {
  final Color bgColor;
  final String fruitName;
  final String price;
  final String fruitDetails;
  final String imageLocation;

  const FruitDetails(
      {Key key,
      this.bgColor,
      this.fruitName,
      this.price,
      this.fruitDetails,
      this.imageLocation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TopBar(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset(imageLocation),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: ListView(
                    children: <Widget>[
                      Text(
                        fruitName,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
