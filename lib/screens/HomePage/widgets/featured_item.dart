import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/helper/constants.dart';
import 'package:travelapp/screens/DetailPage/DetailScreen.dart';
import 'package:travelapp/widgets/rating.dart';

class FeaturedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media;
    media = MediaQuery.of(context);
    // TODO: implement build
    return Container(
      width: media.size.width * 0.65,
      margin: EdgeInsets.only(right: 6.0),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailScreen()));
        },

        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("images/testImage1.jpg", fit: BoxFit.cover, width: media.size.width * 0.75, height: 290,),),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.0)
                  ),
                  child: Icon(Icons.bookmark, color: kPrimaryColor,),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: kScreenWidth(context),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)
                  ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.black.withAlpha(0),
                      ]
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child: Rating("4,6"),
                      ),
                      Text("Lighthouse\nexcursions",style: TextStyle(letterSpacing: 1.4,fontSize: 28.0, fontWeight: FontWeight.w500 ,color: Colors.white),)
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