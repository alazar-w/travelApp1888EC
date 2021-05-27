import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/helper/constants.dart';
import 'package:travelapp/screens/DetailPage/widgets/detail_item.dart';
import 'package:travelapp/screens/HomePage/HomeScreen.dart';
import 'package:travelapp/widgets/rating.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData media;
    media = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    child: Image.asset(
                      "images/testImage2.jpg",
                      fit: BoxFit.cover,
                      width: media.size.width,
                      height: media.size.height,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    child: FlatButton(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      },
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 10,
                    child: FlatButton(
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      },
                    ),
                  ),
                  Positioned(
                    bottom: media.size.height * 0.36,
                    right: 0,
                    child: Container(
                      width: kScreenWidth(context),
                      padding: EdgeInsets.only(bottom:60.0, left: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black54,
                            Colors.black.withAlpha(2),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Rating("4,6"),
                          ),
                          Text(
                            "Lighthouse\nexcursions",
                            style: TextStyle(
                                letterSpacing: 1.4,
                                fontSize: 28.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                        height: media.size.height * 0.4,
                        child: DetailItem(_scaffoldKey)),
                  ),
                  Positioned(
                    bottom: media.size.height * 0.37,
                    right: 40,
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0)
                      ),
                      child: Card(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)
                      ),child: Icon(Icons.bookmark, color: kPrimaryColor,)),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      );
  }
}
