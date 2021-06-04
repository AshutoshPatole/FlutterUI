import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttersidebar/Models/dataModel.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scaleFactor = 1.0;
  double borderRadius = 1.0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: Colors.white,
      ),
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                isDrawerOpen
                    ? IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          setState(() {
                            xOffset = 0.0;
                            yOffset = 0.0;
                            scaleFactor = 1.0;
                            borderRadius = 1.0;
                            isDrawerOpen = false;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            xOffset = 250.0;
                            yOffset = 150.0;
                            scaleFactor = 0.6;
                            borderRadius = 25;
                            isDrawerOpen = true;
                          });
                        },
                      ),
                Text(
                  "AndroidAuthority",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: newsImages.length,
                itemBuilder: (context, int index) {
                  return Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(newsImages[index]),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AutoSizeText(
                                  newsTitle[index],
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.left,
                                ),
                                AutoSizeText(
                                  newsDetail[index],
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
