import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/helper/constants.dart';

class BookingDateItem extends StatelessWidget {
  final bool isActive;
  final String title;
  final int date;
  final Function onTap;
  BookingDateItem({this.isActive, this.title, this.date, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        width: 40.0,
        padding: EdgeInsets.symmetric(vertical:10.0),
        decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          children: <Widget>[
            Text(
              "$title", style: TextStyle(color: isActive ?  Colors.white :Colors.black54),
            ),
            Text(
                "$date", style: TextStyle(color: isActive ? Colors.white :Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}